# DEPLOY_08_CICD

<h1 align=center>Deployment 8</h1>

Welcome to deployment 8, it's time to put all the pieces together!! Time to create a full CI/CD Pipeline.

- This repo has an application you will have to create a pipleine for.
- Review past deployments to help you finish this deployment.
- Deployment 8 will be due 12/04/2021.
- Please review submission requirements below: 

***Requirements:*** 
- [x]Create a logical topology of all the software and components used in this deployment
- [x]Document your process and any issues that you experienced 
- [x]Reports genertated from the front-end test and the security check, must encrypted and then added to your repo 
- [x]Create a GitHub repository for your documentation
- [x]Must use the technologies below:
1. Docker
2. Ansible
5. Cypress


👉Link to deployment instructions: [here](https://github.com/kura-labs-org/DEPLOY_08_CICD/blob/main/Deployment%208.pdf)  
![image](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0vQbTWDSkdWZYD_g_QVr4x8IbVCdmi-Yv3w&usqp=CAU)


<h1> Documentation </h1>
The purpose of this deployment is for individual leaners to create a full working pipeline to deploy an application, test the application, package the product and upload to dockerhub. Parts of the requirements that we must meet is to utilize Docker, Ansible and Cypress. For my deployment, I will use Ansible to create the infrastructure, I will use Cypress to test the React Front End Application, and Docker to build an image and upload to the dockerhub repository.

<h2>Predeployment Environment</h2>
For this part, we will be using AWS to create the deployment. What this means is that we must create an environment that is suitable to the needs of the application. A VPC with 4 subnets, 2 in private and 2 in public will be created to ensure that that we can develop in one environment, while keeping the other environment safe through security protocols.

We will is Ansible to do the following:
- Create VPC, Subnet, Internet Gateway and Routing Table
- Create Security groups that will dictate the ingress and egress of the servers that we will be using.
- Create EC2 on t2.micro for a Jenkins Main, Jenkins Agent, and Docker

Based on the goals of [this](https://github.com/kura-labs-org/DEPLOY_08_CICD/blob/main/Deployment%208.pdf), We will do the following.

- Use Jenkins on main to instruct Jenkins on agent to build a front end application with a flask backend to interact with a sqlite3 backend.
- Jenkins will also run a cypress test on the front end of the application to ensure asserted values are corrected, meaning that the application loads and elements that are found are present.
- If successful, this application will then be repackaged into a docker image through a dockerfile and pushed to dockerhub.
- Jenkins main will be generate a report, which then must be encrypted and uploaded to this current repository.

Amazon's ECR and ECS system will be used along with RDS to work in conjunction of this deployment.

<h2>Set up</h2>

We will run the ansible playbook for the vpc Maker, followed by the SG group, and last the ec2 maker. Each one can be run in succession of one another so long as it is in that order. This will help create a variable file that contains variables that can pass the arguments to the next script. run ```ansible-playbook vpcMaker.yaml SecurityGroupMaker.yml ec2maker.yml```

We will also set up 2 repositories on ECR. Open aws ECR, set up 2 public repositories. The commands for the repositories will be used in the set up and be placed inside the Docker bash script.

Mind you, there is a manual configure that is necessary to edit in the script for the AWS ECR as we will use the ```aws configure``` command to put in the credentials for the our AWS. Make sure this awscli used here is version 2 and above or the ecr public command will not work.

<h2>EC2 Set ups </h2>

While we can also have ansible run a script to log into the EC2, followed by running a script, the scope of this deployment took longer than expected, so a manual approach was taken.

We will log into each EC2 and run the bash script for each respective EC2. Just be wary to chmod the script file to ensure it runs properly.

<h3> Jenkins Main </h3>

Jenkins main terminal will output a line of characters at the end of the script. This will be the password that we need to use for the setup admin in the webgui. Run the recommended set up and then default settings.

We will then connect the EC2 for the Agent and the Docker to the Jenkins Main so all the builds can be done on the agents as opposed to the main. The settings used will be a credentials for the EC2 agents via SSH, a non verifying strategy, and for these ec2, the directory will be ```/home/ubuntu``` as we are using Ubuntu OS for our EC2 in the agents. The IP address that can be used is the private IP since the SG groups are set to allow for inbound between all ips within the VPC.

Next, for the set up of the pipeline

<h4> Pipeline </h4>

There will be two pipelines that need to be made. The first pipeline will be used to build the Front end application and then build the image, followed by pushing it to the Amazon ECR.
