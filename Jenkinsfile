pipeline {
    agent {
        label "AgentEc2Two"
    }
    stages {
        stage('Build') { 
            steps { 
                sh '''
                npm install
                npm run build
                sudo npm install -g serve
                serve -s build &
                '''
                sh 'echo "completed build"'
            }
        }
        stage('Test'){
            steps{
                sh '''
                npm test
                '''
                sh 'echo "completed test"'
            }
        }
        stage('Pre-Deployment'){
          agent {
            label 'DockerEc2'
          }
          environment {
          DOCKERHUB_CREDENTIALS = credentials("syip11-dockerhub")
          }
            steps{
                sh '''
                sudo sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sudo docker pull public.ecr.aws/j2k9r8d3/deploy8pub:latest
                sudo docker image tag public.ecr.aws/j2k9r8d3/deploy8pub:latest deploy08:latest
                echo "completed Pre-Deploy Step"
                '''
            }
        }
        stage('Deploy'){
            agent{
                label 'DockerEc2'
            }
            steps{
                sh 'echo "Deploy step"'
                sh 'sudo docker push public.ecr.aws/j2k9r8d3/deploy8pub:latest'
            }
        }
        }
       
    }
