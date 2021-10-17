
FROM ubuntu:latest


WORKDIR /home/
# Copy files:
COPY startbot.sh /home/
COPY startup.sh /home/
COPY extras.sh /home/

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository ppa:openjdk-r/ppa \
    && apt-get update -q \
    && apt install -y openjdk-11-jdk


RUN apt update \
&& apt install wget unzip -y \
&& wget --no-check-certificate "https://github.com/cddc22/hhhh/releases/download/q/joal.zip" \
&& pwd \
&& unzip joal.zip \
&& ls

COPY startbot.sh /home/
COPY startup.sh /home/
COPY extras.sh /home/
# Run bot script:
CMD bash /home/startbot.sh
