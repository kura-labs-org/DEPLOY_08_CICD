pipeline {
  agent { label 'test'}

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
      steps {
        sh ''' 
        npm install cypress
        npm install mocha
        sudo apt install -y xvfb
        npx cypress run --spec ./cypress/integration/test.spec.js
        npm test
        '''
      }
      post {
            always {
                    junit 'results/cypress-report.xml'
                    }
           }
    }
}
