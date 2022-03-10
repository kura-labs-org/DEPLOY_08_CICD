pipeline {
    
  tools {nodejs "node"}
  
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
        npm install cypress
        
        npm install mocha       
       
        '''
      }
   


    }
  }
} 
