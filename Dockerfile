#Build satge
FROM openjdk:11 AS base
WORKDIR /opt/hello-spring
COPY ./ ./
RUN ./gradlew assemble \
   && rm -rf /root/.gradle

#Runtime stage
FROM amazoncorretto:11
WORKDIR /opt/helo-spring
COPY --from=base /opt/hello-spring/build/libs/helo-spring-0.0.1-SNAPSHOT.jar ./
CMD java -jar helo-spring-0.0.1-SNAPSHOT.jar

FROM postgres:9.6.23-alpine3.14

FROM bitnami/nginx:1.21.1-debian-10-r46