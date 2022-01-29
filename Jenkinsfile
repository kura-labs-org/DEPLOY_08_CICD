pipeline {
    agent {
        label "ag1"
    }
    
 environment {
   DOCKERHUB_CREDENTIALS = credentials("ad-docker-pw")
}

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                
                sh '''
                npm install
                npm run build
                sudo npm install -g serve
                serve -s build
                '''
            }
        }
        stage('Test') {
            agent {
                label "a2"
            }
            
            steps {
                echo 'Testing..'
                
                
                
                sh '''
                  npm install cypress
                  npm install mocha
                  npm cypress run --spec \
                  ./cypress/integration/test.spec.js
               
                '''
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                
                junit 'results/cypress-report.xml'
            }
        }
    }
}

