function git
  # If it has been more the 30 seconds since this message has been printed, print it again
  if test (math (date +%s)-(cat /tmp/git-magit-cooldown)) -ge 30
    set_color red ^&2
    echo "Remember to use Magit" | little_boxes ^&2
    set_color normal ^&2
  end

  # Save current seconds since epoc in tmp file
  date +%s > /tmp/git-magit-cooldown

  command git $argv
end
