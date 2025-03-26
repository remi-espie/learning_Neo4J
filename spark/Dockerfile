FROM hseeberger/scala-sbt:11.0.14.1_1.6.2_2.12.15 as builder
WORKDIR /app
COPY . .
RUN sbt package

# Second stage: Create the final image
FROM openjdk:11
COPY --from=builder /app/target/scala-2.12/simple-project_2.12-1.0.jar /app/simple-app.jar
ENTRYPOINT ["java", "-jar", "/app/simple-app.jar"]