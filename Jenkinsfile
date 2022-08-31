pipeline {
  agent {
    docker {
      image 'zowe/daemon'
      args '-u root'
    }
  }
  environment {
    ZOWE_CREDS = credentials('zowe-automation')
  }
  stages {
    stage('info') {
      steps {
        sh 'node --version'
        sh 'zowe --version'
      }
    }
    stage('set credentials') {
      sh 'zowe config set profiles.base.properties.user $ZOWE_CREDS_USR'
      sh 'zowe config set profiles.base.properties.password $ZOWE_CREDS_PSW'
    }
    stage('status') {
      sh 'zowe zosmf check status'
    }
    // stage('build') {
    //   sh 'npm run build'
    // }
    // stage('deploy') {
    //   sh 'npm run deploy'
    // }
  }
}
