function git
  # If it has been more the 30 seconds since this message has been printed, print it again
  if test (math (date +%s)-(cat /tmp/git-magit-cooldown)) -ge 30
    set_color red
    echo "Remember to use Magit" | little_boxes
    set_color normal
  end

  # Save current seconds since epoc in tmp file
  date +%s > /tmp/git-magit-cooldown

  command git $argv
end
