-- Create a menubar icon to configure our customizations
menu = hs.menubar.new()
menu:setTitle("HS")

toggles = {
  yubikeySleep = "on"
}


menu:setMenu(function()
  return {
    {
      title = "Sleep/Wake on Yubikey",
      state = toggles.yubikeySleep,
      fn = function(modifiers, item)
        if (toggles.yubikeySleep == "on") then
          toggles.yubikeySleep = "off"
        else
          toggles.yubikeySleep = "on"
        end
        print("Toggling, yubikeySleep is now '" .. toggles.yubikeySleep .. "'")
        item.state = toggles.yubikeySleep
      end
    }
  }
end)

-- Sleep when my yubikey is removed
watcher = hs.usb.watcher.new(function (event)
  if (toggles.yubikeySleep == "on") then
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

