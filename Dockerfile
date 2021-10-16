
FROM adoptopenjdk:11.0.11_9-jre-hotspot


WORKDIR /joal/
# Copy files:
COPY startbot.sh /home/
COPY startup.sh /home/
COPY extras.sh /home/


VOLUME /data

ENTRYPOINT ["java","-jar","/joal/joal.jar"]
CMD ["--joal-conf=/data"]

 
# Run bot script:
CMD bash /home/startbot.sh
