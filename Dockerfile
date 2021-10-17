

FROM ubuntu:latest as joal


WORKDIR /home/
# Copy files:
COPY startbot.sh /home/
COPY startup.sh /home/
COPY extras.sh /home/

RUN apt update \
&& apt install wget unzip -y \
&& wget --no-check-certificate "https://github.com/cddc22/hhhh/releases/download/q/joal.zip" \
&& mkdir joal \
&& unzip joal.zip -d joal \
&& ls

FROM lpicanco/java11-alpine

COPY startbot.sh /home/
COPY startup.sh /home/
COPY extras.sh /home/
COPY --from=joal /home/joal /home/joal
# Run bot script:
CMD java -Xmx480M -jar  /home/joal/jack-of-all-trades-2.1.26.jar  --joal-conf="/home/joal/"

