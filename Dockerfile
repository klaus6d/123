
FROM adoptopenjdk:11.0.11_9-jre-hotspot

LABEL name="joal"
LABEL maintainer="joal.contact@gmail.com"
LABEL url="https://github.com/anthonyraymond/joal"
LABEL vcs-url="https://github.com/anthonyraymond/joal"

WORKDIR /joal/
# Copy files:
COPY startbot.sh /home/
COPY startup.sh /home/
COPY extras.sh /home/


VOLUME /data

ENTRYPOINT ["java","-jar","/joal/joal.jar"]
CMD ["--joal-conf=/data"]

# Run extras.sh and clean up APT:
#RUN sh /home/extras.sh \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
# Run bot script:
CMD bash /home/startbot.sh
