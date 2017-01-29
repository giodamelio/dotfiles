#!/bin/bash
disks() {
  lsblk -a | little_boxes --title "Mount Points"
  df -h | little_boxes --title "Disk Usage"
}
