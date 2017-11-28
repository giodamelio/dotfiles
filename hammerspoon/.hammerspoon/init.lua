-- Create a menubar icon to configure our customizations
menu = hs.menubar.new()
menu:setTitle("HS")

settings = {
  yubikeySleep = {
    text = "Sleep/Wake on Yubikey",
    type = "toggle",
    value = true
  },
  postureReminder = {
    text = "Posture reminder",
    type = "toggle",
    value = true
  }
}

-- Dynamically generate menu based on settings
menu:setMenu(function()
  menuItems = {}

  for name, setting in pairs(settings) do
    menuItem = {
      title = setting.text
    }

    -- Handle menu items that are boolean toggles
    if (setting.type == "toggle") then
      -- Set the state based on the setting value
      if (settings[name].value) then
        menuItem.state = "on"
      else
        menuItem.state = "off"
      end

      -- Toggle the value when the menu item is clicked
      menuItem.fn = function()
        settings[name].value = not settings[name].value
        print("Settings: toggling '" .. name .. "' to '" .. tostring(settings[name].value) .. "'")
      end
    end

    table.insert(menuItems, menuItem)
  end

  return menuItems
end)

-- Sleep when my yubikey is removed
watcher = hs.usb.watcher.new(function (event)
  if (settings.yubikeySleep.value) then
    if (event.productName == "Yubikey 4 OTP+U2F+CCID" and event.productID == 1031) then
      if (event.eventType == "removed") then
        print("Yubikey removed, sleeping")
        hs.caffeinate.systemSleep()
      else
        print("Yubikey inserted, waking up")
        hs.caffeinate.declareUserActivity()
      end
    end
  end
end)
watcher:start()

-- Remind me to have good posture
function createPostureNotification()
  return hs.notify.show('Posture', 'Remember to have good posture', '');
end

notification = createPostureNotification()
hs.timer.doEvery(hs.timer.minutes(5), function()
  if (settings.postureReminder.value) then
    notification:withdraw();
    notification = createPostureNotification()
  end
end)
