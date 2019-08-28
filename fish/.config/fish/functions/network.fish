function network
    # Print network interfaces
    switch (uname)
      case "Darwin"
        echo "THIS IS TERRIBLE!!!"
        ifconfig | grep "inet " | tr -d "\t" | cut -d " " -f 2
      case "Linux"
        ip -4 -o a | cut -d ' ' -f 2,7 | cut -d '/' -f 1 | column -t
    end | little_boxes --title "Network Interfaces"

    # Print public ip addresses
    printf 'ipv4 %s\nipv6 %s\n' (curl --silent --ipv4 icanhazip.com) (curl --silent --ipv6 icanhazip.com)  | little_boxes --title "Public IP Address"

    # Print location if "jq" command is present
    if command --search jq > /dev/null do
        printf 'location %s\n' (curl -s http://ipinfo.io/ | jq -r '.city + " " + .country') | little_boxes --title "GeoIP"
    end

    # Do a quick ping to google to test internet connectivity
    ping -c 4 -i 0.2 google.com | little_boxes --title "Ping Google"
end
