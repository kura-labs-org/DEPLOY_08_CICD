pipeline {
  agent{

    label 'Agent One'

  }
  triggers {
    pollSCM('')
  }
  stages {
    stage ('Build Application') {
      
      steps {
        sh 'rm -rf ./kura_test_repo/cypress2'
        dir('./frontend'){
          sh '''
            npm install
            npm run build
            sudo npm install -g serve
            serve -s build &
            '''
        } 
        
      }
    }
    stage ('Testing Frontend w/ Cypress') {
      agent {
        label 'Agent Two'
      }
      steps {
        dir('./frontend'){
          sh '''
            npx cypress run --spec ./cypress/integration/test_frontend.spec.js
            '''
        }

      }
      
      post {
        always {
           dir('./kura_test_repo'){
            junit 'results/cypress-report.xml'
           }
        }
      }
    }

    stage ('Build Docker Image'){

    }

    stage ("Login to Docker"){
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
    }

    stage ("Push to Dockerhub"){

    }

    stage ('Deploy') {

    }
  }
}