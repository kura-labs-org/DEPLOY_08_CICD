pipeline {
  agent { label 'test'}

  stages {
    stage ('Build') {
      steps {
      sh '''
        sudo apt install npm -y
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
        sudo apt install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb -y
        npm install cypress
        npm install mocha
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
}
