pipeline {
  agent {
      label 'agent-d8'
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
        sh 'echo "Build stage finised."'
      }
    }
    stage ('Second') {
      steps {
      sh ''' 
        npm install cypress
        npm install mocha
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
