FROM jenkins/jenkins:alpine

# Switch to root user to install dependencies
USER root

# Install Docker inside Jenkins container
RUN apk add --update docker openrc

# FROM jenkins/jenkins:alpine

# # Switch to root user to install dependencies
# USER root

# # Install OpenJDK 17 and Docker inside Jenkins container
# RUN apk add --no-cache openjdk17 docker openrc

# # # Switch back to Jenkins user
# # USER jenkins
