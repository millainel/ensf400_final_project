# # # FROM jenkins/jenkins:alpine

# # # # Switch to root user to install dependencies
# # # USER root

# # # # Install Docker inside Jenkins container
# # # RUN apk add --update docker openrc

# # FROM jenkins/jenkins:alpine

# # USER root

# # # Install Java 11 (OpenJDK) and Docker inside Jenkins container
# # RUN apk add --no-cache \
# #     openjdk11 \
# #     docker \
# #     openrc

# # # Set JAVA_HOME for Java 11
# # ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk \
# #     PATH="$JAVA_HOME/bin:$PATH"

# # USER jenkins

# FROM jenkins/jenkins:alpine
# # switch to root user
# USER root

# # install docker on top of the base image
# RUN apk add --update docker openrc

# # Install Gradle dependencies
# RUN apk add --no-cache \
#     openjdk11 \
#     bash \
#     docker \
#     curl \
#     unzip

# # Set Gradle version
# ENV GRADLE_VERSION=7.6
# ENV GRADLE_HOME=/opt/gradle
# # Download and install Gradle
# RUN mkdir -p ${GRADLE_HOME} && \
#     curl -fsSL https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o /tmp/gradle.zip && \
#     unzip /tmp/gradle.zip -d /opt/gradle && \
#     rm /tmp/gradle.zip

# # Add Gradle to PATH
# ENV PATH="${GRADLE_HOME}/gradle-${GRADLE_VERSION}/bin:${PATH}"

# # Verify installation
# RUN gradle -v