# Documentation

Table of Contents

- AWS
- Jenkins
- Cypress


Building, Testing and Deploying a Flask application 

Set up Jenkins Master EC2, Agent EC2, Production EC2
Spin up 3 Ubuntu instances 
Port to have open 
Master 
-8080 (port 8080 is for assess to Jenkins)
-22 (port 22 is SSH access)
-5000(port 5000 always for applicaion to run on web)
-80(port 80 for Http access)

Agent 
-22 (used to ssh into agent)

Production 
-5000 (port 5000 always for applicaion to run on web)


In your terminal

First start with connecting the first 2 ec2s 
```
$ ssh -i (add pem key) ubuntu@<public.ip>
$ sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'sudo apt install jenkins
$ sudo apt update
$ sudo apt install java
$ sudo apt install default-jre
$ java -version
$ sudo apt install default-jdk
$ javac -version
$ sudo systemctl start jenkins
$ sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
Next attach ec2 ip address to port 8080 get access to Jenkins. Next add given password from last command. Install the recommended plugins. From there we want to add the agent in Jenkins.

Open New terminal window

Connect Master to Agent
```
$ nano ~/.ssh/authorized_keys
$ cat ~/.ssh/id_rsa.pub
$ nano ~/.ssh/authorized_keys
$ ssh -i ~/.ssh/id_rsa ubuntu@<public.ip of agent>
```
Next attach ec2 ip address to port 8080 get access to Jenkins. Next add given password from last command. Install the recommended plugins. From there we want to add the agent in Jenkins.

![Screen Shot 2021-12-05 at 4 21 35 PM](https://user-images.githubusercontent.com/84725239/144764566-78e22c5f-7919-426c-967d-2a96493981a7.png)

Select build executor status to add agent

![Screen Shot 2021-12-05 at 4 21 58 PM](https://user-images.githubusercontent.com/84725239/144764544-288771d7-a504-42bc-be02-a35ff2601db8.png)

Select New Node

![Screen Shot 2021-12-05 at 4 22 10 PM](https://user-images.githubusercontent.com/84725239/144764547-3da91eb4-e227-405a-b938-5212e67af38b.png)

Add node name and select permanent agent

![Screen Shot 2021-12-01 at 11 02 11 AM](https://user-images.githubusercontent.com/84725239/144765436-8ba7e3a6-5a75-497c-9106-f13c1f37c7ee.png)

Add name of Agent and labels and number of executors and path

For the name I named it Agentt and the number of executors at 2 and finally the path at /home/ubuntu/jenkins.

Master -> Agent
```
$ nano ~/.ssh/authorized_keys
$ cat ~/.ssh/id_rsa.pub
$ nano ~/.ssh/authorized_keys
$ ssh -i ~/.ssh/id_rsa ubuntu@<public.ip of agent>
```

After these steps the Multibranch pipeline was created.

Add the Github repository from which the assignment is being done under the HTTP Repository URL
![Screen Shot 2021-12-05 at 5 04 53 PM](https://user-images.githubusercontent.com/84725239/144765898-3b7acd1b-9314-498b-96a6-98e7d656d35b.png)

Select Jenkinsfile to allow the build of the application to be run by the Jenkinsfile

![Screen Shot 2021-12-05 at 5 05 07 PM](https://user-images.githubusercontent.com/84725239/144765923-d0f905f7-6eea-49bb-a505-39e14e58c4e3.png)

My Jenkinsfile

![Screen Shot 2021-12-05 at 5 16 25 PM](https://user-images.githubusercontent.com/84725239/144766120-558dd2db-bf4f-45e5-bda1-21cad47629e9.png)

After selecting build now and running it a few times was a successful build and test of the application was garnered.

![SuccessfulBuildandTest](https://user-images.githubusercontent.com/84725239/144767005-cfa8424c-c695-4ec5-a106-2f21bfca2d7a.png)
