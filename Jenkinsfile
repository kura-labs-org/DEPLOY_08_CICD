pipeline {
  agent {
      label 'agent1'
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
    stage ('Second') {
      agent {
        label 'agent1'
      }
      steps {
      sh ''' 
        npm install cypress
        npm install mocha
        npx cypress run --spec ./cypress/integration/test.spec.js
        '''
      }
      post {
        always {
          junit 'results/cypress-report.xml'
        }      
      }
    }
    stage ('Docker Image Make') {
      agent {
        label 'agent2'
      }
      steps {
      sh ''' 
         docker build -t frontend1 .
         docker tag frontend1:latest public.ecr.aws/a8o2g9z3/frontend1:latest
         docker push public.ecr.aws/a8o2g9z3/frontend1:latest
        '''
      }
    }

  }
} 
