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
        npm install cypress
        npm audit fix --force
        npm install mocha
        npm audit fix --force
        npx browserslist@latest --update-db
        npm audit fix --force
        npx cypress run --spec ./cypress/integration/test.spec.js
        npm audit fix --force
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
