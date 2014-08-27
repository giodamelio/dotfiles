# -*- coding: utf-8 -*-
import subprocess

from i3pystatus import Status

# Icons used are from AUR ttf-font-icons
# Cheetsheet https://www.dropbox.com/s/9iysh2i0gadi4ic/icons.pdf

status = Status(standalone=True)

# Diaplay the clock
status.register(
    "clock",
    format="%a %-d %b %I:%M:%S"
)

# Show battery status
status.register(
    "battery",
    format="{status} {percentage:.2f}%",
    alert=True,
    alert_percentage=5,
    status={
        "DIS":  "\uF212",
        "CHR":  "\uF211",
        "FULL": "\uF213",
    }
)


# Show wifi status
status.register(
    "wireless",
    interface="wlp2s0",
    format_up="\uF405 {essid} {quality:03.0f}%"
)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register(
    "pulseaudio",
    format="\uF027 {volume}"
)

status.run()

# Reddit icon \uF33B
