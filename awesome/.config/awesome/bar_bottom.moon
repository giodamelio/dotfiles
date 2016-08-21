awful = require("awful")
wibox = require("wibox")
naughty = require("naughty")
vicious = require("vicious")

seperator = require("widgets.seperator")
space = require("widgets.space")

for s = 1, screen.count()
    -- Create bar
    bar_bottom = awful.wibox.new({
        position: "bottom",
        screen: s,
        height: 16
    })

    -- Setup our widgets {{

    -- Clock widget
    clock_widget = wibox.widget.textbox()
    vicious.register(clock_widget, vicious.widgets.date, "%A %B %d, %I:%M %p")

    -- Battery widget
    battery_widget = wibox.widget.textbox()
    vicious.register battery_widget,
        vicious.widgets.bat,
        ((widget, args) ->
            status = args[1]
            percent = args[2]
            color = if percent < 20
                "red"
            elseif percent < 50
                "yellow"
            else
                "green"

            "<span color='#{color}'>#{status} #{percent}%</span>"
        ),
        60,
        "BAT0"

    -- Wifi widget
    wifi_widget = wibox.widget.textbox()
    vicious.register wifi_widget,
        vicious.widgets.wifi,
        ((widget, args) ->
            ssid = args["{ssid}"]
            linp = args["{linp}"] -- Connection quality in percent
            color = if linp < 40
                "red"
            elseif linp < 70
                "yellow"
            else
                "green"
            "<span color='#{color}'>#{ssid} #{linp}%</span>"
         ),
        30,
        "wlo1"

    -- Volume widget
    volume_widget = wibox.widget.textbox()
    vicious.register(volume_widget, vicious.widgets.volume, "$1%", 2, "Master")

    -- MPD widget
    mpd_widget = wibox.widget.textbox()
    vicious.register mpd_widget,
      vicious.widgets.mpd,
      ((mpdwidget, args) ->
        return if args["{state}"] == "Stop"
          "<span color='red'> - </span>"
        else
          args["{Artist}"] ..' - ' .. args["{Title}"]
      ),
      3

    -- Space widget
    -- space_widget = wibox.widget.textbox()
    -- vicious.register space_widget,
    --  space,
    --  ((spacewidget, args) ->
    --    "People in space: #{args.number}"
    --  ),
    --  86400

    -- }}

    -- Right aligned layout
    right_layout = wibox.layout.fixed.horizontal()

    -- Add widgets left to right
    right_layout\add(mpd_widget)
    right_layout\add(seperator)
    right_layout\add(volume_widget)
    right_layout\add(seperator)
    right_layout\add(wifi_widget)
    right_layout\add(seperator)
    right_layout\add(battery_widget)
    right_layout\add(seperator)
    right_layout\add(clock_widget)

    -- Left aligned layout
    left_layout = wibox.layout.fixed.horizontal()

    -- Add widgets left to right
    -- left_layout\add(space_widget)

    -- Main layout
    layout = wibox.layout.align.horizontal()
    layout\set_right(right_layout)
    layout\set_left(left_layout)

    -- Add layout to bar
    bar_bottom\set_widget(layout)

