local awful = require("awful")
local wibox = require("wibox")

-- Create bar
bar_bottom = awful.wibox.new({
    position = "bottom",
    screen = 1,
    height = 16,
})

-- Clock widget
local clock_widget = awful.widget.textclock("%A %B %d, %I:%M %p")

-- Right aligned layout
local right_layout = wibox.layout.fixed.horizontal()
right_layout:add(clock_widget)

-- Main layout
local layout = wibox.layout.align.horizontal()
layout:set_right(right_layout)

-- Add layout to bar
bar_bottom:set_widget(layout)

