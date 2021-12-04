Documentation
Table of Contents
AWS
Jenkins
Cypress


Building, Testing and Deploying a Flask application 
Set up Jenkins Master EC2, Agent EC2, Production EC2

In your terminal

First start with connecting the first 2 ec2s 
ssh -i (add pem key) ubuntu@<public.ip>
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'sudo apt install jenkins
sudo apt update
sudo apt install java
sudo apt install default-jre
java -version
sudo apt install default-jdk
javac -version
sudo systemctl start jenkins
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

Next attach ec2 ip address to port 8080

ssh into agent 
nano ~/.ssh/authorized_keys
cat ~/.ssh/id_rsa.pub
nano ~/.ssh/authorized_keys
ssh -i ~/.ssh/id_rsa ubuntu@<public.ip>

