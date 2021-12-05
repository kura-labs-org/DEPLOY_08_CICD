pipeline {
  agent { label 'Prod'}

  stages {
    stage ('Pull Image') {
      steps {
      sh 'docker pull deploy8:dec4'
      }
    }

     stage ('Start Container') {
      steps {
      sh 'docker run deploy8:dec4'
      }
    }   

    stage ('Stress Test') {
      steps {
      sh 'stress-ng --cpu 0 -t 1m'
      }
    }

}