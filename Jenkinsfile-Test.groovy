pipeline {
  agent { label 'test'}
  environment{
      DOCKERHUB_CREDENTIALS = credentials('kentan404-dockerhub')
    }
  
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
        '''
      }
      post {
            always {
                    junit 'results/cypress-report.xml'
                    }
           }
    }
        stage ('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage ('Push') {
      steps {
        sh '''
        var1=$( docker images --filter 'dangling=true' --format "{{.ID}}" )
        docker tag $var1 kentan404/deploy7repo:deploy7repo
        docker push kentan404/deploy7repo:deploy7repo
        docker image prune -a -f
        '''
      }
    }
}
}
