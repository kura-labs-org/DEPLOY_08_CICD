    #!/bin/bash

    sudo apt-get update -y && sudo apt-get upgrade -y
    
    sudo apt-get install git -y
	
    sudo apt install openjdk-11-jdk -y
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

    sudo apt-get update -y
    sudo apt-get install jenkins -y

    sudo systemctl daemon-reload
	  sudo systemctl start jenkins
    sudo cat /var/lib/jenkins/secrets/initialAdminPassword
