function network
  in_box "Network Interfaces" \
    "ip -4 -o a | cut -d ' ' -f 2,7 | cut -d '/' -f 1 | column -t"
    in_box "Public IP Address" "printf 'ipv4 %s\nipv6 %s\n' (curl --silent --ipv4 icanhazip.com) (curl --silent --ipv6 icanhazip.com)"
  in_box "Ping Google" "ping -c 4 -i 0.2 google.com"
end
