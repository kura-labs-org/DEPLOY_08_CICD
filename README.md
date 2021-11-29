# Deploy_full_stack_app

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

    [ansible_nodes]

    [Agents]
    3.95.150.116 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/east1key.pem

    [Jenkins]

    ```


### Installing dependencies on our EC2s with Ansible

1. Use the install_dependencies_play.yaml playbook to install git, nodejs, and npm onto our agent.

    ```
    ansible-playbook Agents install_dependencies_play.yaml -i aws_inventory
    ```



#### Todo 

1. ~~Update bash script to install jenkins on an ubuntu instance on AWS~~
2. ~~Add Production environment to list of instances to be created.~~
3. ~~Create a playbook to install universal dependencies on all environments such as java, git, etc~~
4. Frontend App requires Javascript and the backend app requires Python. 


#### Fun Errors
 
1. The Jenkins install page is out of date doesn't point to right key location
2. Used git reset to undo 2 previous commits cause they contained AWS credentials in the secrets.yaml file.
    ```
    git reset --hard HEAD~2
    ```