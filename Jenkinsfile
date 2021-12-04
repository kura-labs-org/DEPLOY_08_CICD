pipeline {
  agent{

    label 'Agent One'

  }
  triggers {
    pollSCM('')
  }

  environment {
        DOCKERHUB_CREDENTIALS = credentials('zcyrus')
  }

  stages {
    stage ('Build Application') {
      
      steps {
        dir('./frontend'){
          sh '''
            npm install
            npm run build
            sudo npm install -g serve
            npm run start
            serve -s build &
            '''
        
        }
      }
    }
    stage ('Testing Frontend w/ Cypress') {
      steps {
        dir('./frontend'){
          sh '''
            npx cypress run --spec ./cypress/integration/0-frontend-app/testing_frontend.spec.js
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
      steps {
        dir('./frontend'){
          sh '''
          sudo chmod 666 /var/run/docker.sock
          docker build -t zcyrus/react-front:latest .
          '''

        
        }
        dir('./backend'){
          sh '''
          docker build -t zcyrus/python-backend:latest . 
          '''
        }
      
      }
    


    }

    stage ("Login to Docker"){
      steps {
        sh '''echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'''

      }
    }

    stage ("Push to Dockerhub"){


      steps {

        sh '''docker push zcyrus/react-front:latest'''
        sh '''docker push zcyrus/python-backend:latest'''

      }

    }
    */


  }
}