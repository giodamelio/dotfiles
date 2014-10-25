function moniter
    set vga (xrandr  | sed -n "s/^\(VGA-.\).*/\1/pg")
    switch $argv[1]
        case single
            xrandr --output LVDS --primary --auto --output $vga --off
        case dual
            xrandr --output LVDS --auto --primary --output $vga --auto --right-of LVDS
        case dual-left
            xrandr --output LVDS --primary  --auto --output $vga --auto --left-of LVDS
        case "*"
            echo "Usage: moniter [single|dual|dual-left]"
    end
end
