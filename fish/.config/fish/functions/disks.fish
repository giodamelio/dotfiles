function disks
  switch (uname)
    case Linux
      set command "lsblk -a"
    case Darwin
      set command "diskutil list"
  end
  eval $command | little_boxes --title "Disks"
  df -H | little_boxes --title "Disk Usage"
end
