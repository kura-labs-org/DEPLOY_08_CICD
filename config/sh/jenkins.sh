if ! [ $(id -u) = 0 ]; then
	echo "Run as root"
	exit
fi 
  amazon-linux-extras install java-openjdk11 -y
  amazon-linux-extras install epel -y
  yum install git -y
  wget -O /etc/yum.repos.d/jenkins.repo \
 https://pkg.jenkins.io/redhat-stable/jenkins.repo
  rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
  yum upgrade -y
  yum install epel-release java-11-openjdk-devel -y
  yum install jenkins -y 
  systemctl start jenkins
  sleep 25
  cat /var/lib/jenkins/secrets/initialAdminPassword