# During this DevOps project, we are going to deploy our application on three different kind of target environment:
## 1. Tomcat Server
## 2. Docker Container
## 3. Docker Container with the help of Ansible
## 4. Kubernetes

# DevOps Project — CI/CD -1: Build and deploy the application on Tomcat server.
![CompleteCICDProject!](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*7XSkEENMpQu7UZNBG5lsdQ.jpeg) 
###### Project ToolBox 🧰
- [Git](https://git-scm.com/) Git will be used to manage our application source code.
- [Jenkins](https://www.jenkins.io/) Jenkins is an open source automation CI tool which enables developers around the world to reliably build, test, and deploy their software.
- [Maven](https://maven.apache.org/) Maven will be used for the application packaging and building including running unit test cases
- [Tomcat](https://tomcat.apache.org/tomcat-8.5-doc/introduction.html)) Apache Tomcat, is an open-source web server and servlet container developed by the Apache Software Foundation. It is one of the most widely used application servers for deploying and running Java-based web applications, particularly Java Servlets and JavaServer Pages (JSP)cases.

For this, we are going to set up CI/CD pipeline with the help of GitHub Jenkins Maven, and Tomcat.

## Setup CI/CD with Github, Jenkins, Maven and Tomcat
1) Setup Jenkins
2) Setup and configure Maven and Git
3) Setup Tomcat Server
4) Integrate Github, Maven, Tomcat Server with Jenkins
5) Create CI/CD job
6) Test the deployment

# DevOps Project — CI/CD -2: Build and deploy the application on Docker Container
![CompleteCICDProject!](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*wOB5ogt2NZDrl1NK4ZUD4w.jpeg) 
In the first step of the project, we had an environment with Git, GitHub, Jenkins, Maven, and Tomcat, we were able to 
commit our code to GitHub, and Jenkins will pull the code from GitHub, build with the help of Maven and 
deploy it on a Tomcat server.

In this step, we are going to use GitHub, Jenkins, and Maven to deploy our artifacts on a Docker container.
For this, we are going to set up CI/CD pipeline with the help of GitHub Jenkins Maven, and Docker.

## Setup CI/CD with Github, Jenkins, Maven and Docker
1) Setup Docker environment
2) Write Dockerfile
3) Create an image and container on docker host
4) Integrate docker host with Jenkins
5) Create CI/CD job to build and deploy on a container
6) Test the deployment

# DevOps Project — CI/CD -3: Build and deploy the application on Docker Container with the help of Ansible
![CompleteCICDProject!](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*8_dYR0ccwpNUExDec6BI_w.jpeg) 
In the previous Step (DevOps Project — CI/CD -2), We setup Jenkins to fetch the updated code from our github
repository and initiate a build using Maven, creating a docker image and subsequently deploying this docker container 
onto a docker host. In that case, we used Jenkins as a tool for both building and deploying applications. 

However, in this Step, we are going to use Ansible as a deployment tool, so that Jenkins only need to do the 
administrative kind of activities.
So:
  * Jenkins is going to take the code from GitHub and build artifacts and copy those artifacts onto Ansible server.
  * Ansible’s task to create images and deploy the containers: Ansible is going to take the artifact and with the
    help of a Dockerfile it creates a Docker image.
  * This Docker image, we can commit it into the Docker hub because Docker Hub is a repository to store Docker images.
  * Now whenever we execute any Ansible playbook to deploy a container, this Docker host communicates with the Docker
    hub and pull the image whatever we mentioned in our playbook and create a container out of it.

## Setup CI/CD with Github, Jenkins, Maven Ansible and Docker
1) Setup Ansible server
2) Integrate Docker host with Ansible
3) Create Ansible playbook to create an image
4) Create Ansible playbook to create container
5) Integrate Ansible with Jenkins
6) Create a CI/CD job to build code on Ansible and deploy it on Docker container

1) Setting up the ansible server
   * Create an ec2 instance (Amazon Linux 2, t2.micro, Security group: open 22 and 8080) and connect to the terminal
   * Setup a secure remote access to the server:
     sudo su -
     useradd ansadmin
     passwd ansadmin
     vim /etc/ssh/sshd_config  ( PasswordAuthentication yes )
     visudo                    ( ansadmin        ALL=(ALL)       NOPASSWD: ALL )
     systemctl restart sshd
     sudo su - ansadmin
     ssh-keygen
     sudo su -
     amazon-linux-extras install ansible2 -y
     python --version
     ansible --version
   2) Integrate Docker host with Ansible




# DevOps Project — CI/CD -4: Build and deploy the application on Kubernetes
![CompleteCICDProject!](https://miro.medium.com/v2/resize:fit:4800/format:webp/1*FL0KIKHghcOb3OB2qJVSdw.jpeg) 
In the previous Step (DevOps Project — CI/CD -3), we were able to deploy the application on a Docker container successfully.
However, in case the Docker container goes down, there is no way to recover.
To solve that problem,
In this Step, we're going to build on the previous environment, But instead of Docker host, we are going to deploy the 
applications on a Kubernetes Cluster. We are going to deploy it as a pod on our Kubernetes environment.

## Setup CI/CD with Github, Jenkins, Maven, Ansible and Kubernetes
1) Setup Kubernetes (EKS)
2) Write pod, service, and deployment manifest files
3) Integrate Kubernetes with Ansible
4) Write Ansible playbooks to create deployment and service
5) Integrate Ansible with Jenkins
6) Create a CI/CD job to build code on Ansible and deploy it on Kubernetes Cluster












