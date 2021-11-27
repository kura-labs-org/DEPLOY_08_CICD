pipeline {
    agent {
        label "AgentEc2Two"
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
              pass
            }
        }
        
        stage('Push'){
            steps {
                pass
            }
        }
    }
}
