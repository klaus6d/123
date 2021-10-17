

FROM ubuntu:latest as joal


WORKDIR /home/
# Copy files:
COPY startbot.sh /home/
COPY startup.sh /home/
COPY extras.sh /home/

RUN apt update \
&& apt install wget unzip -y \
&& wget --no-check-certificate "https://github.com/klaus6d/123/raw/master/qq.zip" \
&& mkdir joal \
&& unzip qq.zip -d joal \
&& ls

FROM lpicanco/java11-alpine

COPY startbot.sh /home/
COPY startup.sh /home/
COPY extras.sh /home/
COPY --from=joal /home/joal /home/joal
# Run bot script:
CMD bash /home/startbot.sh
