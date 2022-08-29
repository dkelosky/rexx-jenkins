pipeline {
    agent { docker { image 'zowe/daemon' } }
    
    environment {
    }
    
    stages {
        stage('build') {
            steps {
                sh "pwd"
                sh 'node --version'
                sh 'zowe --version'
            }
        }
    }
}
