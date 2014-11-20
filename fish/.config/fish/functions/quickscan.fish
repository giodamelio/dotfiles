function quickscan
    set IP (ip -0 -f inet addr show wlp2s0 | sed -n 2p | sed "s/^ *//" | cut -d " " -f 2)
    sudo nmap -T4 -F $IP
end
