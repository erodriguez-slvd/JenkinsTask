### Getting started
* Install and configure JDK 11
* Install and configure [Apache Maven 3.6.0+](http://maven.apache.org/)
* Download and start the latest [Selenium standalone server](http://www.seleniumhq.org/download/)
* Download the latest version of [Eclipse](http://www.eclipse.org/downloads/) and install [TestNG plugin](http://testng.org/doc/download.html)
* [Read Carina documentation](https://zebrunner.github.io/carina/)

### Import to Eclipse
If generation is successfully complete, you would see a new project folder with a name equal to the artifactId attribute specified during generation, so navigate to that folder (where pom.xml is located) and execute the following Maven task:
```
mvn clean eclipse:eclipse
```
By executing this command, Maven should resolve all dependencies, downloading required libraries to your local repository and generating Eclipse classpath. Before importing new project to Eclipse, you should link your IDE to your Maven repository by executing the following task:
```
mvn -Dworkspace=<path_to_workspace> eclipse:configure-workspace
```
Here you have to specify the absolute path to the Eclipse workspace. After that, restart Eclipse IDE. Now you can import generated projects such as "Existing Java Project" into Eclipse IDE.
Generate Eclipse workspace using command:
```
mvn clean eclipse:eclipse
```

### Run tests
```
mvn clean test -Dsuite=api
```
## Implementation details
### Docker
1. Create Dockerfile
2. Build the Docker image using the following command in the carina-demo folder
```
docker build -t carina-demo .
```
3. And then you can run the container using the following command. This will build the Docker image named "carina-demo" and run a container based on that image. The Maven tests will be executed automatically when the container starts.
```
docker run carina-demo
```
### Docker compose
1. Create the docker-compose.yml file. Include the docker compose version installed in your system. Replace your_service_name with the name of your service and adjust the paths accordingly if your Dockerfile is located in a different directory.
2. To implement sharing of files between container and your computer using volumes, you can use volumes to share files between your container and your local system. Add 'volumes' key and replace /path/to/local/folder with the path to your local folder and adjust /path/in/container/target to the path where your target folder is expected inside the container.
3. Set up passing of environment variables via docker-compose.yml. You can define environment variables in the docker-compose.yml file under the environment key. Replace ENV_VARIABLE_NAME with the name of your environment variable and value with its value.
4. Run your container with docker-compose. You can start your container using **docker-compose up -d command**. Make sure you run this command in the same directory where your docker-compose.yml file is located.
5. Check target folder presence in your local file system after finishing of test run. After the test run is completed, you can check if the target folder has appeared in your local file system at the specified location.
6. Check logs of started container. You can check the logs of the container using **docker-compose logs** command. This will display the logs of all services defined in your docker-compose.yml file.
```
version: '2.18'
services:
    your_service_name:
        build:
            context: .
            dockerfile: Dockerfile
        volumes:
            - /path/to/local/folder:/path/in/container/target
        environment:
            - ENV_VARIABLE_NAME=value
```