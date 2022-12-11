FROM openjdk:11
COPY target/*.jar /
ENTRYPOINT ["java", "-jar","/ExamThourayaS2-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080
