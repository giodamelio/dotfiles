function moniter
    set vga (xrandr  | sed -n "s/^\(VGA-.\).*/\1/pg")
    switch $argv[1]
        case single
            xrandr --output LVDS --primary --auto --output $vga --off
        case dual
            xrandr --output VGA-0 --mode 1600x900 --pos 1366x0 --rotate right --output LVDS --mode 1366x768 --pos 0x832 --rotate normal
        case dual-left
            xrandr --output VGA-0 --mode 1600x900 --pos 0x0 --rotate right --output LVDS --mode 1366x768 --pos 900x832 --rotate normal
        case "*"
            echo "Usage: moniter [single|dual|dual-left]"
    end
end
