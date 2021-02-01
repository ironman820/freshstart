#!/usr/bin/env zsh
xset s 500 &
xautolock -time 1 -locker "betterlockscreen -l dim" -notify 30 -notifier "notify-send 'Locker' 'Locking screen in 30 seconds'" -killtime 5 -killer "systemctl suspend"
#xautolock -time 2 -locker "systemctl suspend"
