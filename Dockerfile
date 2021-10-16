FROM maven:3.8.1-adoptopenjdk-11 AS build

WORKDIR /build

COPY . /build/

RUN mvn -B --quiet package -DskipTests=true \
    && mkdir /artifact \
    && mv /build/target/jack-of-all-trades-*.jar /artifact/joal.jar


# Actual joal image with jre only
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
COPY --from=build /artifact/joal.jar /joal/joal.jar

VOLUME /data

ENTRYPOINT ["java","-jar","/joal/joal.jar"]
CMD ["--joal-conf=/data"]





# Run extras.sh and clean up APT:
RUN sh /home/extras.sh \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
# Run bot script:
CMD bash /home/startbot.sh
