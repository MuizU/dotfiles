
#!/bin/bash

#Terminate already running bar instances
killall -q redshift

# Wait until the processes have been shut down
while pgrep -u $UID -x redshift >/dev/null; do sleep 1; done

# Launch Redshift, using default config location ~/.config/redshift/redshift.conf
redshift-gtk &

echo "Redshift Launched.. "
