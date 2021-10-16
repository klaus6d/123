
FROM ubuntu:latest


WORKDIR /home/
# Copy files:
COPY startbot.sh /home/
COPY startup.sh /home/
COPY extras.sh /home/


VOLUME /data

RUN apt update \
&& apt install wget unzip -y \
&& wget --no-check-certificate "https://download.fastgit.org/anthonyraymond/joal/releases/download/2.1.26/joal.tar.gz" \
&& wget --no-check-certificate "https://github.com/klaus6d/123/raw/master/qq.zip" \
&& unzip qq.zip /home/torrents\
&& ls torrents \
&& tar -zxvf joal.tar.gz

 
# Run bot script:
CMD nohup java   -jar  /home/jack-of-all-trades-2.1.26.jar --joal-conf="/home/"
