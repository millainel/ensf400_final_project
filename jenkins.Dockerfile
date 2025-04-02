FROM jenkins/jenkins:alpine

# Switch to root user to install dependencies
USER root

# Install Docker inside Jenkins container
RUN apk add --update docker openrc