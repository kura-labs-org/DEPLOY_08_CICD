terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = ""
  region  = "us-east-2"
}
resource "aws_instance" "jenkinsMaster" {
  ami           = "ami-002068ed284fb165b"
  instance_type = "t2.micro"
  key_name = aws_key_pair.terraform.id
  vpc_security_group_ids = [aws_security_group.ssh.id,aws_security_group.jenkins.id]
  associate_public_ip_address = true
  tags = {
    Name = "jenkinsMaster"
  }
}
resource "aws_key_pair" "terraform" {
  key_name = "terraform"
  public_key = ""
}

resource "aws_instance" "jenkinsAgent" {
  ami = "ami-0629230e074c580f2"
  instance_type = "t2.micro"
  key_name = aws_key_pair.terraform.id
  vpc_security_group_ids = [aws_security_group.ssh.id,aws_security_group.flask.id,aws_security_group.react.id]
  tags = {
    Name = "jenkinsAgent"
  }
}
resource "aws_instance" "jenkinsProduction" {
  ami = "ami-0629230e074c580f2"
  instance_type = "t2.micro"
  key_name = aws_key_pair.terraform.id
  vpc_security_group_ids = [aws_security_group.ssh.id,aws_security_group.flask.id,aws_security_group.react.id]
  associate_public_ip_address = true
  tags = {
    Name = "jenkinsProduction"
  }
}

resource "aws_security_group" "ssh" {
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0 
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "jenkins" {
  ingress  {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0 
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "flask" {
  ingress  {
    from_port = 5000
    to_port = 5000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0 
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "react" {
  ingress  {
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0 
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "Master" {
  value = ["public: ${aws_instance.jenkinsMaster.public_ip}\n private: ${aws_instance.jenkinsMaster.private_ip}"]
}
output "Agent" {
 value=["private: ${aws_instance.jenkinsAgent.private_ip}"]
}
output "Production" {
  value = ["public: ${aws_instance.jenkinsProduction.public_ip}\n private: ${aws_instance.jenkinsProduction.private_ip}"]
}