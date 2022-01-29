pipeline {
    agent {
        label "ag1"
    }
    
 environment {
   DOCKERHUB_CREDENTIALS = credentials("dockerhub-pw")
     
   registry = "andrewdass/my_app_project"
   registryCredential = 'andrewdass'
   dockerImage = 'andrewdass/my_app_project' 
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
            steps {
                echo 'Testing..'
                
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                
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

