pipeline {
    agent { docker { image 'zowe/daemon' } }
    stages {
        stage('build') {
            steps {
                sh "echo $USER"
                sh 'node --version'
                sh 'zowe --version'
            }
        }
    }
}
