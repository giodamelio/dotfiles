awful = require("awful")
wibox = require("wibox")
vicious = require("vicious")

seperator = require("widgets.seperator")

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

    -- }}

    -- Right aligned layout
    right_layout = wibox.layout.fixed.horizontal()

    -- Add widgets left to right
    right_layout\add(battery_widget)
    right_layout\add(seperator)
    right_layout\add(clock_widget)

    -- Main layout
    layout = wibox.layout.align.horizontal()
    layout\set_right(right_layout)

    -- Add layout to bar
    bar_bottom\set_widget(layout)

