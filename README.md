# DEPLOY_08_CICD

# Task 1
1. Create 3 EC2's: <br>
* 1st EC2 - Jenkins Master
* 2nd EC2 - Jenkins Agent
* 3rd EC2 - Production <br>

2. **Creating the Master:**
Create an three Amazon EC2. In this demonstration, Ubuntu AMI's was used. Run the following commands to install Jenkins:
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

```
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

# Task 3

# Task 4
1. Place all the files to an application in one folder that is accessible from your computer

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




# Task 5
