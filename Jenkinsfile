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
        dir('./frontend'){
          sh '''
            npm install
            # sudo npm install -g serve
            npm run start &
            '''
        
      }
    }
    stage ('Testing Frontend w/ Cypress') {
      steps {
        dir('./frontend'){
          sh '''
            npx cypress run --spec ./cypress/integration/0-frontend-app/test_frontend.spec.js
            '''
        }

      }
      
      post {
        always {
           dir('./frontend'){
            junit 'results/cypress-report.xml'
           }
        }
      }
    }

    /* stage ('Build Docker Image'){

    }

    stage ("Login to Docker"){
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
    }

    stage ("Push to Dockerhub"){

    }

    stage ('Deploy') {

    } */
  }
}