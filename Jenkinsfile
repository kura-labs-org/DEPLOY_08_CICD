pipeline {
  agent {
      label 'agent'
  }
  stages {
    stage ('Build stage') {
      steps {
   
      sh '''
        npm install
        npm run build
        sudo npm install -g serve
        serve -s build &
        '''
        sh 'echo "Build stage finised."'
      }
    }
    stage ('Test stage') 
      steps {
      sh ''' 
        npm install cypress
        npm install mocha
        sudo apt-get install -y xvfb
        npx cypress run --spec ./cypress/integration/test.spec.js
        npm test
        '''
        sh 'echo "Test stage finised."'
      }
      post {
        always {
          junit 'results/cypress-report.xml'
        }
          
      }
    }
  }
} 
