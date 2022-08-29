pipeline {
  agent { 
    docker { 
      image 'zowe/daemon'
      args '-u root'  
    } 
  }
    
  stages {
    stage('build') {
      steps {
        sh 'node --version'
        sh 'zowe --version'
      }
    }
  }
}
