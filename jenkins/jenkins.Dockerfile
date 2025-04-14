# FROM jenkins/jenkins:alpine

# # Switch to root user to install dependencies
# USER root

# # Install Docker inside Jenkins container
# RUN apk add --update docker openrc

FROM jenkins/jenkins:alpine

# Switch to root user to install dependencies
USER root

# Install Docker inside Jenkins container
RUN apk add --update docker openrc

# Install Python 3, pip, and pipenv
RUN apk add --no-cache python3 py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install pipenv


