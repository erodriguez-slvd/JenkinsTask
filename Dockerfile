# Use JDK 11 as base image
FROM adoptopenjdk/openjdk11

# Set working directory inside the container
WORKDIR /docker-carina-demo

# Install Maven
RUN apt-get update && apt-get install -y maven

# Copy carina-demo project files into the container
COPY ./src /docker-carina-demo
COPY ./pom.xml /docker-carina-demo
ENV SUITE=api

# Run Maven tests when the container starts
CMD ["mvn","clean", "test", "-Dsuite=${SUITE}"]
#ENTRYPOINT ["mvn", "clean", "test", "-Dsuite=${SUITE}"]