/*
 ** This is a just a testing file.  See build/Jenkinsfile for the real one.
 ** had to test how to get git pull dokku master to work.  Ran out of time.
 */
node {
    environment {
        DOCKERIMGNAME = 'r3pidokku/sample-node-app'
        DOKKU_URL = 'sample-node-app.r3pidokku'
        /*
         ** Ideally these vars be set at Jenkins job level and passed down as environment / build parameters.
         ** This way multiple docker containers can be run in parallel testing away on a CI server to ensure that every commit
         ** does not break the smoke test.
         ** APPVERSION can be JIRA-ID or Sprint Version or just set it to jenkins ${env.BUILD_NUMBER}
         */
        APPVERSION = '0.0.1'
        // OR
        // APPVERSION = '0.1.${env.BUILD_NUMBER}'
        SRVRPORT   = '3000'
    }
    stage('Example') {
        echo 'print out docker version'
        sh 'docker --version'
        //sh 'echo ${APPVERSION}'
        sh 'echo dockerx build -t ${DOCKERIMGNAME}:${APPVERSION} .'
        // TODO cd to git repo working folder
        //sh 'echo dockerx build -t ${DOCKERIMGNAME}:${APPVERSION} .'
        //echo 'print git info'
        //sh 'git status'
        echo 'print pwd'
        sh 'pwd'
    }
}
