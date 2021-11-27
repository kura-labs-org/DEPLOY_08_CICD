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
                sh '''
                npm install
                npm run build
                sudo npm install -g serve
                serve -s build &
                '''
                sh 'echo "completed build"'
            }
        }
    
        stage('Test') { 
          agent {
            label 'AgentEc2Two'
          }
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
