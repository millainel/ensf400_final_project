FROM gradle:7.6.1-jdk11

COPY . /app

WORKDIR /app

EXPOSE 8080


CMD ["./gradlew", "appRun"]

