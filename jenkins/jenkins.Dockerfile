# FROM jenkins/jenkins:alpine

# # Switch to root user to install dependencies
# USER root

# # Install Docker inside Jenkins container
# RUN apk add --update docker openrc

FROM jenkins/jenkins:alpine

USER root

# Install Java 11 (OpenJDK) and Docker inside Jenkins container
RUN apk add --no-cache \
    openjdk11 \
    docker \
    openrc

# Set JAVA_HOME for Java 11
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk \
    PATH="$JAVA_HOME/bin:$PATH"

USER jenkins