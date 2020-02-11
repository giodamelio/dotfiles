#/bin/bash
servers() {
  # List processes listening on TCP/UDP ports
  sudo netstat -plntu |
  # Get just the TCP servers
  grep tcp |
  # Split the process name and pid up
  sed -e "s/\// /" |
  # Squash the whitespace
  tr -s "[:space:]" |
  # Print a few columns
  awk '{ print $8 "\t" $4 "\t" $7 }' |
  # Add a title line to the beginning
  sed -e "1iName\tAddress\tPID\n" |
  # Align the columns nicely
  column -s$'\t' -t |
  # Box it up and ship it out
  little_boxes --title "TCP Servers"
}
