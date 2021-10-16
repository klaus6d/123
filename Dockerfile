
FROM ubuntu:latest


WORKDIR /home/
# Copy files:
COPY startbot.sh /home/
COPY startup.sh /home/
COPY extras.sh /home/


VOLUME /data

RUN apt update \
&& apt install wget -y \
&& wget --no-check-certificate "https://download.fastgit.org/anthonyraymond/joal/releases/download/2.1.26/joal.tar.gz" \
&& tar -zxvf joal.tar.gz /home.joal

 
# Run bot script:
CMD nohup java   -jar  /home/joal/jack-of-all-trades-2.1.26.jar --joal-conf="/home/q/joal"
