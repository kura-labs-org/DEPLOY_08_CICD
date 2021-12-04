# Deploy_full_stack_app

## Though Process/Flow of Deployment 

### Creating Infrastructure 

The infrastructure consists of 3 total EC2s running an Ubuntu AMI from aws. One EC2 is the Jenkins Master/Controller, the other is the Jenkins Agent which builds and tests the application, and lastly the third EC2 is the production agent.

## Steps to Replicate 

### Provisioning Infrastructure through Ansible

1. Create a secrets.yaml file which will contain your aws access key, aws secret key, and the keypair you use to create instances. (If you don't use a keypair you won't need it)
    ```
    aws_access_key: enter_key_here
    aws_secret_key: enter_key_here
    key_pair: enter_name_of_key_pair_here
    ```
    This will set the variables needed to create our ec2 instances using an ec2 module for ansible. 

2. After the creation of the secrets.yaml file now the run the create_ec2_play playbook. 

    ```
    ansible-playbook -e @secrets.yaml create_ec2_play.yaml
    ```
    By doing this we are able to create a new EC2s for our Jenkins Agent, Controller, and Production system all using an Ubuntu AMI. 

3. Go to your AWS console and copy and paste the public ipv4 address on a notepad for later.

4. Create a file called aws_inventory (no extension). This will be the inventory file ansible uses to know what hosts to connect to. Use the following format. 
    ```

    [Agents]
    18.234.125.150 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/east1key.pem # jenkins agent
    54.234.182.219 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/east1key.pem # production

    [Jenkins-Main]
    3.89.222.189 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/east1key.pem

    [Production]
    54.234.182.219 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/east1key.pem

    ```


### Installing dependencies on our EC2s with Ansible

1. Use the install_dependencies_play.yaml playbook to install git, nodejs, and npm onto our agent.

    ```
    ansible-playbook install_dependencies_play.yaml -i aws_inventory
    ```

### Configure Jenkins

1. SSH to your main Jenkins instance and cat the jenksPassword.txt file to find the jenkins password needed to login.

    ```
    cat jenksPassword.txt
    ```
2. Login to your Jenkins website through the IP address on your AWS EC2 and configure your Jenkins setup with login and plugins. 

### Adding Agent to your Jenkins 

1. Once you login to Jenkins navigate to the manage Jenkins page, and click the manage nodes and clouds.
2. Click new node on the left panel and add a new Agent through SSH. 
3. Once successfully configured we can use this agent to run our builds. 

### Creating our Jenkins Pipeline

1. Create a new item in the Jenkins website using the multi branch configuration and name it whatever you want. 
2. Click build now when your repository is to run the Jenkins script.
3. The pipeline is meant to build our frontend application and test it with cypress, then move on to building our front and backend with the respective Dockerfile in each directory, and finally push those images to our Dockerhub.

### Creating a Cloud Watch Alarm

1. Go to your AWS EC2 console, navigate to your production EC2, click actions, then click monitor and troubleshoot, and finally click manage cloud watch alarms.
2. Set the parameters to what I have in the following or adjust to your liking. 
    ![Cloud Watch Confi](/screenshots/cloud_watch_config.png)
3. Now to set off the alarm run
    ```
    stress-ng --cpu 4 --timeout 120s
    ```
4. Now check the results in console and take a screenshot.

### Encrypting Test Results and Cloud watch results

1. Use ansible-vault encrypt to encrypt your files with ansible.

    ```
    ansible-vault encrypt /path/to/file/cypress-report.xml 
    ```



#### Todo 

1. ~~Update bash script to install jenkins on an ubuntu instance on AWS~~
2. ~~Add Production environment to list of instances to be created.~~
3. ~~Create a playbook to install universal dependencies on all environments such as java, git, etc~~
4. ~~Frontend App requires Javascript and the backend app requires Python.~~


#### Fun Errors
1. The Jenkins install page is out of date doesn't point to right key location
2. Used git reset to undo 2 previous commits cause they contained AWS credentials in the secrets.yaml file.
    ```
    git reset --hard HEAD~2
    ```
3. There's currently a webpack error (used by React) and the latest Node version (17.0) so had to downgrade my Node image to  16.3.0
4. There's an error with the python application where it can't use _mysql so I can't connect to AWS rds
5. Experiencing timeout errors preventing me from running my pipeline all the way.