pipeline {
  agent {
      label 'master'
  }
  stages {
    stage ('Build') {
      steps {
      sh '''
      #! /bin/bash
      python3 -m venv test3
      . ./test3/bin/activate
      pip install pip --upgrade
      pip install pytest
      pip install -r requirements.txt
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
        npx cypress run --spec ./test.spec.js
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
