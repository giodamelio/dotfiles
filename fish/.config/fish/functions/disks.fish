function disks
  # Ensure the necessary commands are installed
  require_commands.py --require all little_boxes --require linux lsblk --require darwin diskutil
  if test $status -eq 1; return 1; end

  switch (uname)
    case Linux
      set command "lsblk -a"
    case Darwin
      set command "diskutil list"
  end
  eval $command | little_boxes --title "Disks"
  df -H | little_boxes --title "Disk Usage"
end
