pipeline {
  agent { 
    docker { 
      image 'zowe/daemon'
      args '-u root'  
    } 
  }
//     agent { docker { image 'zowe/daemon' args '-u root' } }
    
//     environment {
//         ZOWE_CLI_HOME = "$HOME"
//     }
    
    stages {
        stage('build') {
            steps {
                sh "pwd"
//                 echo "$ZOWE_CLI_HOME"
                sh 'node --version'
                sh 'zowe --version'
            }
        }
    }
}
