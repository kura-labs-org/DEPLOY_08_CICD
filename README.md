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
THe purpose of this dpeloyment is for individual leaners to create a full working pipeline to deploy an application, test the application, package the product and upload to dockerhub. Parts of the requirements that we must meet is to utilize Docker, Ansible and Cypress. For my deployment, I wil use Ansible to create the infrastructure, I will use Cypress to test the React Front End Application, and Docker to build an image and upload to the dockerhub repository.

<h2>Predeployment Environment</h2>
For this part, we will be using AWS to create the deployment. What this means is that we must create an environment that is suitable to the needs of the application. A VPC with 4 subnets, 2 in private and 2 in public will be created to ensure that that we can develop in one environment, while keeping the other environment safe through security protocols.

We will is Ansible to do the following:
-- Create VPC, Subnet, Internet Gateway and Routing Table
-- Create Security groups that will dictate the ingress and egress of the servers that we will be using.
-- Create EC2 on t2.micro for a Jenkins Main, Jenkins Agent, and Docker

Based on the goals of [this](https://github.com/kura-labs-org/DEPLOY_08_CICD/blob/main/Deployment%208.pdf), We wil do the following.

--Use Jenkins on main to instruct Jenkins on agent to build a front end application with a flask backend to interact with a sqlite3 backend.
--Jenkins will also run a cypress test on the front end of the application to ensure asserted values are corrected, meaning that the application loads and elements that are found are present.
--If successful, this application will then be repackaged into a docker image through a dockerfile and pushed to dockerhub.
--Jenkins main will be generate a report, which then must be encrypted and uploaded to this current repository.
