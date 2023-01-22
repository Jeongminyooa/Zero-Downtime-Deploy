FROM openjdk:11
ARG JAR_FILE=./build/libs/zero-downtime-deploy-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-Duser.timezone=Asia/Seoul", "-jar","/app.jar"]
