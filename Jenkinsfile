pipeline {
    
  
  
  agent {
      label 'ag1'
  }
  stages {
    stage ('Build') {
      steps {
      
      sh '''
        npm install
        npm run build
        sudo npm install -g serve
        serve -s build &
        '''
      }
    }
    stage ('Test') {
      agent {
        label 'ag1'
      }
      steps {
      sh ''' 

        
        npm test
       
        '''
      }
      post {
        always {
          junit 'results/cypress-report.xml'
        }
          
      }
    }
  }
} 
