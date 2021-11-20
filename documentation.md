# Deployment 8

### Objective
Build a pipeline that deploys and tests an application into a production environment.



### Preparing the Application

Our application hosted in this repo, is a Flask app that assists with equipment tracking. Let's begin by building an image from the application and deploying it onto an EC2, while also pushing it to Docker Hub.

**Step 1**

Let's create a Dockerfile that will build an image of our app. Next we go to Jenkins and set up a Multi-branch pipeline linked to this repository that will utilize its Jenkinsfile. Using credentials (the username + token from the Docker hub account) will allow the pipeline to push it to Dockerhub.

**Step 2**
The pipeline must also build a testing container


### Task Notes from Tyrone
Objective: Create application and test application. We've seen encryption of files through Ansible. 
Security test, probably using nagiosxi. stressing out cpu is for us to be able to receive a cloudwatch report
