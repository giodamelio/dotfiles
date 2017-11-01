-- Sleep when my yubikey is removed
watcher = hs.usb.watcher.new(function (event)
  if (event.productName == "Yubikey 4 OTP+U2F+CCID" and event.productID == 1031) then
    if (event.eventType == "removed") then
      print("Yubikey removed, sleeping")
      hs.caffeinate.systemSleep()
    else
      print("Yubikey inserted, waking up")
      hs.caffeinate.declareUserActivity()
    end
  end
end)
watcher:start()
