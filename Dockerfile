FROM jenkins/jenkins:lts-alpine

USER root

RUN apk update && \
    apk add --no-cache docker openrc bash

RUN addgroup jenkins docker
#This is a docker file
# Use Gradle with JDK 11 as the base image
FROM gradle:7-jdk11

WORKDIR /app

COPY . /app

#Change the permission of the gradlew file
RUN chmod +x gradlew

RUN ./gradlew build

#Exposing port 8080 based on line 118 of build.gradle file
EXPOSE 8080

CMD ["./gradlew", "apprun"]
