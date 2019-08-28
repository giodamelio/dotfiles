function bell
  switch (uname)
    case Darwin
      afplay /System/Library/Sounds/Ping.aiff
    case '*'
      echo 'No bell sound configured for platform:' (uname)
  end
end
