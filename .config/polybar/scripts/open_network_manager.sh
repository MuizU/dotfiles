killall -q wicd-curses

# Wait until the processes have been shut down
while pgrep -u $UID -x wicd-curses >/dev/null; do sleep 1; done

alacritty -e wicd-curses &
