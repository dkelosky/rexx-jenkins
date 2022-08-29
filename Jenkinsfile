pipeline {
    agent { docker { image 'zowe/daemon' } }
    stages {
        stage('build') {
            steps {
                sh 'node --version'
                sh 'zowe --version'
            }
        }
    }
}
