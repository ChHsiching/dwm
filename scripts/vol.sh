#!/bin/sh
# 调整音量并显示通知

# 获取当前音量
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)

# 获取是否静音
MUTE=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -oP 'yes|no')

# 发送通知
if [ "$MUTE" = "yes" ]; then
    notify-send "🔇 Muted"
else
    notify-send "🔊 Volume: $VOLUME"
fi
