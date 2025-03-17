FROM gradle:7-jdk11

WORKDIR /app

COPY . /app

RUN chmod +x gradlew

RUN ./gradlew build

EXPOSE 8080

CMD ["./gradlew", "apprun"]
