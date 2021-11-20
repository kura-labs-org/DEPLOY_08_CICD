pipeline {
    agent {
        label "agent1"
    }
    
  environment {
    DOCKERHUB_CREDENTIALS = credentials("syip11-dockerhub")
}
    stages {
        stage('Build') { 
            steps { 
                sh 'docker build -t syip11/javadem .'
                sh 'echo "completed build"'
            }
        }
    
        stage('Login') { 
            steps { 
              sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
              sh 'echo "completed login"'
            }
        }
        
        stage('Push'){
            steps {
                sh 'docker push syip11/javadem:latest'
                sh 'echo "completed push"'
            }
        }
    }
}
