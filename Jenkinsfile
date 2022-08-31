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
      steps {
        sh 'zowe config set profiles.base.properties.user $ZOWE_CREDS_USR'
        sh 'zowe config set profiles.base.properties.password $ZOWE_CREDS_PSW'
      }
    }
    stage('status') {
      steps {
        sh 'zowe zosmf check status'
      }
    }
    stage('build') {
      steps {
        sh 'npm run build'
      }
    }
    stage('deploy') {
      steps {
        sh 'npm run deploy'
      }
    }
  }
}
