# DEPLOY_08_CICD

# Task 1
## Create 3 EC2's, one EC2 will be a Jenkins master and second EC2 is a Jenkins agent and the third you will use for production
1. Create 3 EC2's: <br>
* 1st EC2 - Jenkins Master
* 2nd EC2 - Jenkins Agent
* 3rd EC2 - Production <br>

2. **Creating the Master:**
In this demonstration, Ubuntu AMI's was used. Run the following commands to install Jenkins:
```
sudo apt search openjdk
```

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/1.png width="1000" />
     </h1>
</html> 

```
sudo apt install openjdk-11-jre-headless
```

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/2.png width="1000" />
     </h1>
</html> 

```
java -version
```
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/3.png width="1000" />
     </h1>
</html> 
Java 11 must be installed on every EC2 for the Master EC2 to recognize agent EC2s. <br>


```
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
```

```
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
```

```
sudo apt-get install jenkins
```

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/4.png width="1000" />
     </h1>
</html> 

```
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl status jenkins
```


<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/5.png width="1000" />
     </h1>
</html> 

3. Go to the internet browser and put the Master EC2 public address followed by 8080

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/6.png width="1000" />
     </h1>
</html> 

4. Retrieve the Jenkins password from concatenating the given line from Jenkins

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/7.png width="1000" />
     </h1>
</html> 
After running the cat command, the line of random numbers and letters is your password to access Jenkins. Enter what was given from the terminal. <br>
<br>
5. Select install suggested plugins

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/8.png width="1000" />
     </h1>
</html> 
6. As shown on Jenkins, create a username and password that should be remembered to access Jenkins everytime on the EC2. Also put your full name and email address.

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/9.png width="1000" />
     </h1>
</html> 
7. The Jenkins homepage should now be accessible:

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/10.png width="1000" />
     </h1>
</html> 
Steps 1-7 can be repeated to install Jenkins for the ec2 that is the Jenkins agent <br>
<br>

8. On the side bar, click 'Manage Jenkins'

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/11.png width="1000" />
     </h1>
</html> 
9. Under 'System Configuration', click 'Manage Nodes and Clouds'

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/11.png width="1000" />
     </h1>
</html> 
10. Click new node:

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/12.png width="1000" />
     </h1>
</html> 
11. Enter the following information in the required boxes:

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/16.png width="1000" />
     </h1>
</html> 

Enter your pem key down below that was used to access the EC2 agent:
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/13.png width="1000" />
     </h1>
</html> 
12. The results should be successful an agent is connected to the Master EC2:

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/17.png width="1000" />
     </h1>
</html> 

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/19.png width="1000" />
     </h1>
</html> 

13. On the 3rd EC2, install Docker:
```
sudo apt-get update
```

```
 sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

```
 curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
Refer to the official Docker website for further instructions and explanations: <br>
https://docs.docker.com/engine/install/debian/
<br>
<br>
14. On the master EC2 run the command:
```
sudo nano key.pem
```
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/20.png width="1000" />
     </h1>
</html> 
Afterwards, a blank screen should appear where the pem file contents can now be pasted into the 'key.pem' file <br> 
<br>

15. Now from the Master, its possible to access the agent EC2's from the terminal as shown below: 
```
sudo ssh -i key.pem ubuntu@
```
After the @ goes the EC2 IPv4 private address
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task1/21.png width="1000" />
     </h1>
</html> 

If there was any issues connecting to one of the agent EC2's from the terminal, run in the Master EC2:
```
sudo 400 chmod key.pem
```
Then retry connecting to an EC2 agent

# Task 2
## Build the application and then create build steps for the application
1. Place all the files to an application in one folder that is accessible from your computer
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task4/1.png width="1000" />
     </h1>
</html> 

The folder should contain your application files. Since a flask app is being deployed, a .py file is being deployed alongside a templates folder that includes html files and a requirements.txt for other computer to download and run this application.  <br>
<br>
The file "Dockerfile" runs a series of commands to successfully download all of the application files and create an image of the application. The contents of the Dockerfile is shown below:

```
FROM python:3.10
COPY ./requirements.txt requirements.txt
COPY templates/ /templates/
RUN pip install -r requirements.txt
COPY application.py application.py
ENV FLASK_APP=application.py
EXPOSE 5000
CMD flask run --host=0.0.0.0
```

2. Open up the EC2 in the terminal that has docker installed

3. It is possible to connect a local host's directory to to another server, locally or virtually which includes an EC2 instance. By running the command shown below, the files in the from the specified localhost's folder will be sent to a specified EC2 directory. Before running copying files to the EC2, create a folder in the EC2 with the command:
```
mkdir ...
```
... is the words that appear after mkdir which gives the name to a created folder. To send files from the localhost to an EC2 follow the format below:

```
scp -i /path/my-key-pair.pem /path/my-file.txt ec2-user@my-instance-public-dns-name:path/
```

/path/my-key-pair.pem : Directory where pem key is located on the localhost to connect to the EC2 <br>
<br>
/path/my-file.txt : Directory of file from a localhost directory that will be sent to the EC2 <br>
<br>
ec2-user : Depending on the image of the ec2, whether its Amazon or Ubuntu image, then ec2-user or ubuntu needs to be put here respectively <br>
<br>
my-instance-public-dns-name : This is the Public IPv4 DNS and can be retrieved on the EC2 page <br>
<br>
path/ : Folder the files will be sent to on the EC2. Once again, create a folder before running this command on the EC2 to send the files to.  <br>
<br>

After successfully performing the scp command in a format shown below, the files from your local system should appear in the EC2:
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task4/6.png width="1000" />
     </h1>
</html> 

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task4/2.png width="1000" />
     </h1>
</html> 


4. After copying the files onto the EC2, build the application from the Dockerfile from the command shown below:
```
sudo docker build -t ---- .
```
* ----: Can be the name that is given to the newly built image
* . : Retrieves the Dockerfile and other files from the current directory. If the "." is not used, replace it with the current directory that contains the application files and Dockerfile.

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task4/7.png width="1000" />
     </h1>
</html> 


5. To run the application in the terminal, perform the "sudo docker run" command to first initialize the application and then "curl localhost:5000" to see the application
```
sudo docker run -d -p 5000:5000 my_app_project
```

```
curl localhost:5000
```
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task4/8.png width="1000" />
     </h1>
</html> 

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task4/9.png width="1000" />
     </h1>
</html>
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task4/10.png width="1000" />
     </h1>
</html> 

# Task 3
## Create a test step that will test the application front end 
1. Go to 'Manage Jenkins' and install the 'Amazon EC2' and 'Maven Integration' plugins
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task3/4.png width="1000" />
     </h1>
</html> 
If there are issues downloading or using the "Maven Intregration" plugin, an alternative is to install Maven directly through the terminal
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task3/5.png width="1000" />
     </h1>
</html> 
2. Make a multi-branch pipeline in Jenkins and connect it to your Github account to access the application's source code <br>
<br>
3. Install the following packages
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task3/6.png width="1000" />
     </h1>
</html> 

4. Create a file named "Jenkinsfile" in the Github repository that contains the application source code. Include the following below in the Jenkinsfile:
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task3/8.png width="1000" />
     </h1>
</html> 

5. In Jenkins, test the application by running the pipeline:
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task3/7.png width="1000" />
     </h1>
</html> 

# Task 4
## Create an image of the application and push the image to Dockerhub

1. To push the image from the EC2 to a Dockerhub account from the terminal, write the command "sudo docker login" 
```
sudo docker login
```
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task4/13.png width="1000" />
     </h1>
</html> 
The image should be named username/image name <br>
Username - The same name of your account username <br>
Image name - The name that is given to the image, which can be anything <br>
<br>

2. Push the image
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task4/15.png width="1000" />
     </h1>
</html> 

3. Go to the Dockerhub account that the image was pushed to and confirm if it was pushed
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task4/16.png width="1000" />
     </h1>
</html> 

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task4/17.png width="1000" />
     </h1>
</html> 

# Task 5
## Run a security check on the application by using a Cloudwatch alarm to assess CPU utilization after stress testing the application on a new EC2 instance
1. Update the master EC2 package list
```
sudo apt-get-update
```
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/1.png width="1000" />
     </h1>
</html> 

2. This EC2 will be configured through a more automated process by using Ansible. A few installation steps is required to run Ansible, which are shown down below: 
```
sudo apt install software-properties-common
```
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/2.png width="1000" />
     </h1>
</html> 

```
sudo apt-add-repository ppa:ansible/ansible
```

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/3.png width="1000" />
     </h1>
</html> 

3. Update the instance again
```
sudo apt update
```

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/4.png width="1000" />
     </h1>
</html> 

4. Install ansible
```
sudo apt install ansible
```
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/5.png width="1000" />
     </h1>
</html> 

5. Update the EC2 again
```
sudo apt-get update
```

6. Install Python
```
sudo apt-get install python
```
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/7.png width="1000" />
     </h1>
</html> 

7. Enter the EC2's ssh directory:
```
cd .ssh
```
```
ls
```
```
sudo apt-add-repository ppa:ansible/ansible
```
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/3.png width="1000" />
     </h1>
</html> 

8. Update the instance again
```
sudo apt update
```

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/4.png width="1000" />
     </h1>
</html> 

9. Install ansible
```
sudo apt install ansible
```
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/5.png width="1000" />
     </h1>
</html> 

10. Update the EC2 again
```
sudo apt-get update
```

11. Install Python
```
sudo apt-get install python
```
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/8.png width="1000" />
     </h1>
</html> 

12. If there is no id_rsa and id_rsa.pub present, then create them by using the 'ssh-keygen' command. id_rsa and id_rsa.pub are private and public keys respectively. 
```
ssh-keygen
```
Run the ls command to see if 
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/9.png width="1000" />
     </h1>
</html> 
13. Retrieve the public key from the master EC2 "cat id_rsa.pub". Copy the entire key from running the cat command <br>
<br>
14. Create a new EC2 instance. After creating a new instance, enter into the ssh directory and edit the "authorized_keys" file by pasting the public key from the master EC2:
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/11.png width="1000" />
     </h1>
</html> 
15. In the master EC2, enter the directory '/etc/ansible' and edit the hosts file:
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/12.png width="1000" />
     </h1>
</html> 
16. In the hosts file, write the following:
```
[Automate]
agent1 ansible_ssh_host= Private IPv4 Address of EC2
```

[] - Any word can be entered within the brackets. The word "Automate" is there as the Master is responsible for automating the following EC2 under the "Automate" heading. <br>
agent1 ansible_ssh_host - Specify the agent that is desired to connect to and the method for doing so <br>
Private IPv4 Address of EC2 - To ensure the Master can always connect to the EC2 agent <br>
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/13.png width="1000" />
     </h1>
</html> 

17. Create a yaml file:
```
sudo nano agent_script.yaml
```
The yaml file can be named anything as long as it contains the ".yaml" extension. In this demonstration it is named agent_script.yaml. 
18. Include the following code in the yaml file:
```

---

- hosts: all
  become: yes
  tasks:
  - name: Install packages
    apt:
      name: 
      - stress-ng
      state: latest

```
Save the changes to the yaml file and then exit after saving
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/20.png width="1000" />
     </h1>
</html> 

19. In the terminal, run the yaml file by using the 'ansible-playbook' command
```
ansible-playbook "nameofyamlfile".yaml
```
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/19.png width="1000" />
     </h1>
</html> 
20. After running the ansible-playbook command, the Master should have configure the agent to download the stress-ng package. To confirm this, run the "stress-ng" command in the agent EC2

<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/21.png width="1000" />
     </h1>
</html> 

Another stress command to run is:
```
stress-ng --matrix 1 -t 1m
```
1 -t 1m means one stress test is runned for one minute to assess the application undergoing a stress test for that time
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/22.png width="1000" />
     </h1>
</html> 
21. Go to the AWS Console to how the stress test affected the CPU Utilization Average of the EC2:
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/23.png width="1000" />
     </h1>
</html> 
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/24.png width="1000" />
     </h1>
</html> 
<html>
     <h1>
        <img style="float: center;" src=/deployment8/task5/25.png width="1000" />
     </h1>
</html> 
