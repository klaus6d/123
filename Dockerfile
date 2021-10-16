
FROM adoptopenjdk:11.0.11_9-jre-hotspot


WORKDIR /joal/
# Copy files:
COPY startbot.sh /home/
COPY startup.sh /home/
COPY extras.sh /home/


VOLUME /data

ENTRYPOINT ["java","-jar","/joal/joal.jar"]
CMD ["--joal-conf=/data"]
RUN apt install wget \
&& wget --no-check-certificate "https://download.fastgit.org/anthonyraymond/joal/releases/download/2.1.26/joal.tar.gz" \
&& tar -zxvf joal.tar.gz

 
# Run bot script:
CMD nohup java   -jar  /home/q/joal/jack-of-all-trades-2.1.26.jar --joal-conf="/home/q/joal"
