FROM openjdk:17-jdk-slim

VOLUME /apps

COPY ./demo/build/libs/*.jar /apps/myapp.jar

ENTRYPOINT ["java", "-jar", "/apps/myapp.jar"]
