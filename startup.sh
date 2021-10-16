#!/bin/bash
 
# Commands to run before starting the bot:
# Check your logs on heroku to see if you were sucessfull

echo "NOTICE: startup.sh is runnning and confing"

sed -i "s/bot_token/$BOT_TOKEN/g" config.js 
sed -i "s/your_tg_userid/$USER_ID/g" config.js 


wget --no-check-certificate -q $TORRENT_ZIP_URL -O sa.zip
unzip -qq sa.zip -d ./ 
ls
