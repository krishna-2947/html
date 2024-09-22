Building a Simple CI/CD Pipeline with Nginx, Docker, and AWS

Introduction : 
        In this project, I built a Continuous Integration and Continuous Deployment (CI/CD) pipeline for a simple login page using Docker, Nginx, and AWS services such as CodeBuild and CodeDeploy. 
        This pipeline automates the process of building, testing, and deploying a web application, showcasing my skills in DevOps and infrastructure automation.The project demonstrates 
        how to containerize a web application, set up a build-and-deploy pipeline using AWS services, and deploy the application onto an EC2 instance, integrating several critical tools like GitHub, Docker, AWS CodeBuild, and AWS CodeDeploy.

Project Architecture : 

The application consists of four key files:

index.html: A basic login page with a modal for user authentication.

appspec.yml: AWS CodeDeploy configuration for deploying the web application.

buildspec.yml: AWS CodeBuild script for building and testing the Docker container.

Dockerfile: Instructions to build the Docker image for the web application.

The overall flow of the pipeline is as follows:

Source Code: The code is stored in a GitHub repository.

Build and Test: AWS CodeBuild builds the Docker image based on the buildspec.yml configuration and runs any tests.

Deployment: AWS CodeDeploy deploys the built Docker container to the EC2 instance using the appspec.yml configuration.

1. HTML Login Page (index.html)
        This is a simple, responsive login form styled with CSS and utilizing a modal for user interaction. The login form collects the username and password, with a "Remember Me" option.
        The form is designed to be user-friendly and responsive, ensuring compatibility across devices by using a flexible layout with media queries.
    Key Features:
        Responsive design using CSS.
        Modal-based login form for clean user experience.
        JavaScript handles the modal visibility.

2. Deployment Configuration (appspec.yml) :
        The appspec.yml file is essential for AWS CodeDeploy, which defines how the application should be deployed on the server. It contains the following sections:
        Files Section: Defines which files from the build should be transferred to the deployment target (EC2).
        Hooks Section: Specifies scripts that should run before, during, and after deployment.
    Key Features:
        Maps the source files (e.g., HTML) to their destination on the EC2 instance.
        Allows for pre- and post-deployment scripts for automation, such as setting up dependencies or configurations.

3. Build Configuration (buildspec.yml) :
        This file defines the build process for the application using AWS CodeBuild. It ensures that the necessary dependencies are installed, the application is built, and the resulting artifacts are packaged.
    Key Features:
        Automates the building and packaging of the Docker image.
        Artifacts (such as Dockerfile and HTML) are retained for later use in the pipeline.
        Pushes the Docker image to Docker Hub for use in Kubernetes or other containerized environments.

4. Dockerfile : 
        The Dockerfile is crucial for containerizing the web application. It defines the steps to set up a Docker image using Nginx to serve the index.html login page.
      This simple Dockerfile:
        Uses the official Nginx image as a base.
        Copies the HTML content from the local machine into the appropriate directory on the Nginx server.
        By using Docker, we ensure that the application can be deployed and run consistently across different environments.

Deployment Pipeline with AWS CodePipeline :

To automate the process from code commit to deployment, we use AWS CodePipeline, which orchestrates the entire CI/CD process. 
CodePipeline automates the steps of building, testing, and deploying your application whenever changes are made in the source repository.
Here’s a breakdown of how CodePipeline integrates with CodeBuild and CodeDeploy to fully automate the deployment process:

Step 1: Source Stage (GitHub Integration)
      CodePipeline is triggered whenever there’s a new commit or pull request in the GitHub repository.
      This is done by connecting GitHub as the source in AWS CodePipeline. Every time you push changes (for example, an updated index.html or changes to the Dockerfile), 
      CodePipeline automatically kicks off the build process.
Key Features:
      Automates the detection of changes in your GitHub repository.
      Eliminates the need for manual intervention when new code is pushed.
      Uses webhooks for real-time integration between GitHub and CodePipeline.

Step 2: Build Stage (AWS CodeBuild)
      Once the source code is fetched from GitHub, CodePipeline triggers AWS CodeBuild to build the Docker image and run any tests. 
      The buildspec.yml file, as explained earlier, defines the build steps such as installing dependencies, building the Docker image, and pushing it to Docker Hub.
    Buildspec.yaml Summary:
      Install Phase: Installs Docker on the CodeBuild environment.
      Build Phase: Builds the Docker image.
      Post-Build Phase: Pushes the Docker image to Docker Hub.
Key Features:
      Ensures that the latest Docker image is built every time there’s a new code push.
      Automates pushing the image to a Docker registry (e.g., Docker Hub or Amazon ECR).
      Any errors in the build phase will automatically halt the pipeline, and notifications can be configured to alert you.

Step 3: Deploy Stage (AWS CodeDeploy) :
      After CodeBuild successfully pushes the Docker image, AWS CodePipeline moves to the Deploy Stage, where AWS CodeDeploy is used to deploy the latest Docker image onto the EC2 instance.
      AWS CodeDeploy follows the instructions provided in appspec.yml to:
      Copy files (like the HTML and Docker image) to the EC2 instance.
      Start the Nginx server to serve the application.
      Run any pre- or post-deployment scripts, such as installing Nginx or cleaning up old deployments.
Key Features:
      Automatically deploys the application on EC2 instances as soon as the build passes.
      Uses CodeDeploy hooks to run any custom scripts for application setup, like starting Nginx or other services.
      Ensures smooth rolling updates with no downtime by deploying to specific instances.

Full CI/CD Pipeline Overview with CodePipeline : 

Source Stage:
        Triggered by a push to the GitHub repository.
        Downloads the latest code and artifacts.

Build Stage:
        AWS CodeBuild builds the Docker image using the Dockerfile.
        The image is pushed to Docker Hub (or any container registry).

Deploy Stage:
        AWS CodeDeploy deploys the application using the Docker image.
        EC2 instances pull the Docker image, and Nginx serves the static content (like index.html)

Conclusion :
        This project demonstrates a complete DevOps pipeline that automates the building, testing, and deployment of a 
        simple web application using Docker, Nginx, and AWS services. By implementing this pipeline, I’ve gained hands-on experience with key DevOps practices, including:
      Continuous Integration (CI) with CodeBuild and Docker.
      Continuous Deployment (CD) with CodeDeploy.
      Infrastructure automation and containerization.

This project is a great demonstration of my ability to work with AWS, Docker, and CI/CD tools in a real-world context.


