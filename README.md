# DEPLOY4CUSTOMAPP

### Table of Contents
* [Aws](#Aws)
* [Terminal](#Terminal)
* [Jenkins](#Jenkins)
* [Frontend](#HTML)


#### Aws
Created an Elastic Beanstalk to see the application that will be later created by me and named it customapp.
Created an Amazon Linux EC2 instance called Jenkinss after I finished setting it up in terms of the attributes and different specifications (storage, security group, tag, etc) I used the given public ipv4
within my terminal.

#### Terminal
Using my terminal I input these following commands:

```

$ sudo yum update -y

$ sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

$ sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

$ sudo yum upgrade

$ sudo yum install jenkins java-1.8.0-openjdk-devel -y

$ sudo amazon-linux-extras install epel

$ sudo systemctl daemon-reload

$ sudo systemctl start jenkins

$ sudo cat /var/lib/jenkins/secrets/initialAdminPassword

```


#### Jenkins
Added 2 plugins before starting
1. AWSEB Deployment Plugin
2. Cloudbees Deployment Plugin

Created a freestyle project
Then within my freestyle project and under source management selected git added my github url containing the custom app respository 
Next I added my elastic beanstalk infomation and 
under the root object a . was included
Under the version label format the build version was add next to python-01${BUILD_ID}


#### HTML
In the application file it was important to set application = app = Flask(__name__) 
to ensure that Jenkins doesnt disrupt the application.

The next command was used to the get and return information from the frontend

The commands following were set in order create variable 

Then several if statements, elif statements, and else statements were set to confirm your chooses and based on your chooses and thhe automated chose of the computer basically you will win or lose or tie based on your choice. 

Then the function render_template was used to call the information in the front.html file

Finally app.run was called to run the code 

layout.css file was utilized to set the background.

front.html file was utilized to format the webpage within the code it is encoded to take the response from the user and respond back with the computers choice and spit back the winner or loser.

#### Issues

#### Terminal issues
With in the terminal the first issue I ran into was when using ssh to connect to my instance after typing in a few commands once I got to this command:
sudo yum install jenkins java-1.8.0-openjdk-devel -y
I received this error
Error: Package: jenkins-2.303.1-1.1.noarch (jenkins)
           Requires: daemonize
To fix this error I had to use this command 
Solution:sudo amazon-linux-extras install epel 

#### Jenkins issues
2 errors that were 

Solutions were creating a new private token re adding files to repository as well as 

Elastic Beanstalk kept coming up as degraded
Solution: Changing app.py to application.py
as well as requirement.py to requirements.py 

I chose to do this application because it was a great debate. Everyday in terms of twitter,barbershops,parks,households this conversation comes up. I am a big fan of all 3 players. Basketball is a topic that creates great debate and is very polarizing and I wanted to create something that added to that discussion. In terms of python a great way to practice if statements.


Unfortunately, I was unable to deploy this app. Until, I removed app.run() at the end of my code , removing this line of code allowed my environment to be shown in the environment of my elastic beanstalk. The reason it didnt work was app.run when its goes through jenkins causes an error when its being read in jenkins which causes it not to apart in the elastic beanstalk.


