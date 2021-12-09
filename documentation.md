# Deployment 8

### Objective
Build a CI/CD pipeline.


### Step 1: Building the Image and Pushing to Dockerhub

Our application is a Flask app that assists with equipment tracking. Let's begin by building an image from the application and deploying it onto an EC2, while also pushing it to Docker Hub.

Let's create a Dockerfile that will build an image of our app. Next we go to Jenkins and set up a Multi-branch pipeline linked to this repository that will utilize its Jenkinsfile. Adding credentials (the username + token from the Docker hub account) to Jenkins will allow the pipeline to push it to Dockerhub. We also set up an agent with which we will build our application.

**Dockerfile**

```
FROM python:3.10
WORKDIR /home
COPY ./requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . /home
ENV FLASK_APP=application.py

ENTRYPOINT flask run --host=0.0.0.0
```

**Jenkinsfile**
```
agent { label 'Agent01' }
    
    environment {
        DOCKERHUB_CREDENTIALS = credentials('SrKoDes-Docker')
     }
    
    stages {
        stage('Build & Deploy') {
            steps { 
                sh '''
                sudo docker build -t srkodes/scan_proj .
                sudo docker run -d -p 5000:5000 srkodes/scan_proj
                '''
            }
        }
        stage('Push to DH') {
            steps {
                sh '''
                echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                sudo docker push srkodes/scan_proj:latest
                '''
            }     
        }
    }        
```
## Step 2: Testing our Front End
We will also use this agent to run a front end test. We will install the necessary dependencies to allow for a Cypress test. We need to make sure we have a `/cypress/integration/*.spec.js` file that will test the front end, as well as a cypress.json file in the root. Without these two files, cypress will fail to test our front end. Our pipeline looks like this:

```
  stage('Test') {
            steps {
                sh '''
                sudo apt update
                sudo apt install npm xvfb libatk1.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth -y
                npm install cypress
                npm install mocha
                npx cypress run --spec ./cypress/integration/test.spec.js
                '''
            }
            post {
                always {
                    junit 'results/cypress-report.xml'
                }
            }
        }
```




**Task Notes from Tyrone**
Objective: Create application and test application. We've seen encryption of files through Ansible. 
Security test, probably using gauntlt. stressing out cpu is for us to be able to receive a cloudwatch report




### Step 3: A 2nd Agent
We're going to set up a third EC2 as the production environment and run security tests. All the code at the bottom of the Jenkinsfile works when inputted in the EC2's terminal. It's about getting it to work in the Jenkinsfile. The XSS will run and a report is made.


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


TO DO: 
ENCRYPT SEC REPORT
BE ABLE TO PUSH THE XSS REPORT TO THE GITHUB REPO
CLOUDWATCH
ENCRYPT AND ADD TO REPO
CONFIGURE SERVERS WITH ANSIBLE (STEP1)
CREATE LOGICAL TOPOLOGY OF ALL SOFTWARE AND COMPONENTS
