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
        stage('Deployment'){
          agent {
            label 'DockerEc2'
          }       
            steps{
                sh '''
                docker pull 649474668035.dkr.ecr.us-east-1.amazonaws.com/deploy08
                docker image tag 649474668035.dkr.ecr.us-east-1.amazonaws.com/deploy08:latest deploy08:latest
              
                echo "completed Deploy Step"
                '''
            }
        }
        }
    }
