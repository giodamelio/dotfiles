awful = require("awful")
wibox = require("wibox")
vicious = require("vicious")

seperator = require("widgets.seperator")

-- Create bar
bar_bottom = awful.wibox.new({
    position: "bottom",
    screen: 1,
    height: 16
})

-- Setup our widgets {{

-- Clock widget
clock_widget = wibox.widget.textbox()
vicious.register(clock_widget, vicious.widgets.date, "%A %B %d, %I:%M %p")

-- }}

-- Right aligned layout
right_layout = wibox.layout.fixed.horizontal()

-- Add widgets left to right
right_layout\add(seperator)
right_layout\add(clock_widget)

-- Main layout
layout = wibox.layout.align.horizontal()
layout\set_right(right_layout)

-- Add layout to bar
bar_bottom\set_widget(layout)

