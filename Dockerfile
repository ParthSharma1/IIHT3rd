FROM openjdk:latest

# Add Maintainer Info
LABEL maintainer="ps11659@gmail.com"


ADD target/pixogram.jar Pixogram.jar

# Make port 8083 available to the world outside this container
EXPOSE 8083

# Run the jar file 
ENTRYPOINT ["java","-jar","Pixogram.jar"]