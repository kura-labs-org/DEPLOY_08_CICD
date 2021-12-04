pipeline {
    agent {
        label "Agent1"
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
        stage('Deploy'){
            agent{
                label 'Docker1'
            }
            steps{
                sh 'echo "Deploy step"'
            }
        }
        }
       
    }