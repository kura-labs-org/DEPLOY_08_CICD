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




### Step 3
Objective: Were going to set up a third EC2 as the production environment and run security tests.

```
We're going to set up an Ubuntu instance with the default settings. We're going to use gauntlt-docker and gruyere to test our instance. We first need to install a host of dependencies to make this all work. Use the following code:
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get install docker-ce docker-ce-cli containerd.io -y python3-pip p7zip-full npm default-jre

```

