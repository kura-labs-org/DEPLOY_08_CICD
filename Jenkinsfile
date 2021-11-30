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
        stage('Pre-Deploy'){
            steps{
                sh '''
                echo "starting Pre-Deploy"
                '''
                sh 'echo "completed Pre-Deploy"'
            }
        }
        stage('Deployment'){
            steps{
                sh '''
                echo "completed Deploy Step"
                '''
            }
        }
        }
    }
