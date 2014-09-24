function tunnel
    if test (count $argv) -ge 3
        ssh -nNT -R $argv[3]:localhost:$argv[1] $argv[2]
    else
        echo "Usage: tunnel <local_port> <server> <remote_port>"
    end
end

