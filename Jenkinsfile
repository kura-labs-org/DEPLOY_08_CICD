pipeline {
  agent {
      label 'master'
  }
  stages {
    stage ('Build') {
      steps {
      sh 'rm -rf ./kura_test_repo/cypress2'
      sh '''
      #! /bin/bash
      python3 -m venv test3
      source test3/bin/activate
      pip install pip --upgrade
      pip install pytest
      pip install requirements.txt
      py.test --verbose --junit-xml test-reports/results.xml
      flask run
      '''
      }
    }
    stage ('Second') {
      agent {
        label 'agent-ubuntu'
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
  }
} 
