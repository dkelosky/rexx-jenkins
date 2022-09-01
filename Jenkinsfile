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
    stage('Versions') {
      steps {
        sh 'whoami'
        sh 'cat zowe-init.log'
        sh 'node --version'
        sh 'zowe --version'
      }
    }
    stage('Credentials') {
      steps {
        sh 'zowe config set profiles.base.properties.user $ZOWE_CREDS_USR'     // set user
        sh 'zowe config set profiles.base.properties.password $ZOWE_CREDS_PSW' // set password
      }
    }
    stage('Config') {
      steps {
        sh 'chmod +x writeUserConfig.sh'                                      // enable shell script
        sh './writeUserConfig.sh $ZOWE_CREDS_USR'                              // write config/local.json5
        sh 'cat config/local.json5'                                            // echo contents
        sh 'ls -la'
      }
    }
    stage('Check status') {
      steps {
        sh 'zowe zosmf check status'
        sh 'ls -la'
      }
    }
    stage('Make data set') {
      steps {
        sh 'zowe jobs list jobs'
        sh 'zowe files create pds "kelda16.work.temp.ds"'
      }
    }
    stage('Add dependencies') {
      steps {
        sh 'npm install --ignore-scripts'
      }
    }
    stage('Allocate') {
      steps {
        sh 'npm run allocate'
      }
    }
    stage('Deploy') {
      steps {
        sh 'npm run deploy'
      }
    }
  }
}
