#!/bin/bash
network() {
    ip -4 -o a | cut -d ' ' -f 2,7 | cut -d '/' -f 1 | column -t | little_boxes --title "Network Interfaces"
    printf 'ipv4 %s\nipv6 %s\n' $(curl --silent --ipv4 icanhazip.com) $(curl --silent --ipv6 icanhazip.com)  | little_boxes --title "Public IP Address"
    ping -c 4 -i 0.2 google.com | little_boxes --title "Ping Google"
}
