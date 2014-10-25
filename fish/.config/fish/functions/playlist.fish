function playlist
    if test (count $argv) -gt 1
        # Make sure we don't have too many arguments
        echo "Too many arguments"
        echo "Usage: playlist <playlist name>"
        return 1
    else if test (count $argv) -lt 1
        # Make sure we have enough arguments
        echo "Too few arguments"
        echo "Usage: playlist <playlist name>"
        return 1
    end

    echo "Playing playlist \"$argv[1]\""
    mpc clear > /dev/null
    mpc load $argv[1] > /dev/null
    mpc play > /dev/null
end

