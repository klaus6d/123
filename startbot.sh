#!/bin/bash

# Do not edit this file!



/cd /home/her
#npm install --unsafe-perm=true --allow-root

echo "Loading startup.sh..."
bash /home/startup.sh
echo "Starting Bot..."
nohup java   -jar  /home/q/joal/jack-of-all-trades-2.1.26.jar --joal-conf="/home/q/joal"
