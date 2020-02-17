disks() {
  lsblk --all --exclude 7 | little_boxes --title "Disks"
  df -H | grep -Ev "(loop|tmpfs)" | little_boxes --title "Disk Usage"
}
