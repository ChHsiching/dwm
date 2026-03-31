#!/bin/sh
# 调整亮度并显示通知

BRIGHTNESS=$(brightnessctl get)
MAX=$(brightnessctl max)
PERCENT=$(awk "BEGIN {printf \"%d%%\", ($BRIGHTNESS/$MAX)*100}")

notify-send "🔆 Brightness: $PERCENT"
