
FROM ubuntu:latest


WORKDIR /home/
# Copy files:
COPY startbot.sh /home/
COPY startup.sh /home/
COPY extras.sh /home/


RUN apt install -y openjdk-11-jdk

RUN apt update \
&& apt install wget unzip -y \
&& wget --no-check-certificate "https://download.fastgit.org/anthonyraymond/joal/releases/download/2.1.26/joal.tar.gz" \
&& wget --no-check-certificate "https://github.com/klaus6d/123/raw/master/qq.zip" \
&& unzip qq.zip  -d /home/torrents\
&& ls torrents \
&& tar -zxvf joal.tar.gz

 
# Run bot script:
CMD bash /home/startbot.sh
