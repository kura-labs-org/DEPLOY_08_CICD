curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install openjdk-11-jdk -y
sudo apt install jenkins -y
sudo systemctl daemon-reload
sudo systemctl start jenkins
echo "This script has updated the packages and installed Jenkins and all the requirements. Below this message is the password needed to log into the jenkins web gui"


sudo cat /var/lib/jenkins/secrets/initialAdminPassword
