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
                npm install cypress
                npm install mocha
                sudo apt-get install -y xvfb
                npx cypress run --spec ./cypress/integration/test.spec.js
                npm test
                '''
                sh 'echo "completed test"'
            }
            post {
              always {
              junit 'results/cypress-report.xml'
            }
          
          }
        }
            
        stage('Pre-Deployment'){
          agent {
            label 'DockerEc2'
          }
            steps{
                sh '''
                sudo docker pull public.ecr.aws/j2k9r8d3/deploy8pub:latest
                sudo docker image tag public.ecr.aws/j2k9r8d3/deploy8pub:latest syip11/deploy08:latest
                echo "completed Pre-Deploy Step"
                '''
            }
        }
        stage('Deploy'){
            agent{
                label 'DockerEc2'
            }
            environment {
            DOCKERHUB_CREDENTIALS = credentials("syip11-dockerhub")
            }
            steps{
                echo "logging in"
                echo '$DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                echo "login completed"
                sh 'echo "Deploy step"'
                sh 'docker push syip11/deploy08:latest'
            }
        }
        }
}

