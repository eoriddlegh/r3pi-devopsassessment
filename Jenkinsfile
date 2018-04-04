node {
    environment {
        /*
         ** Ideally these vars be set at Jenkins job level and passed down as environment / build parameters.
         ** This way multiple docker containers can be run in parallel testing away on a CI server to ensure
         ** that every commit / push does not break the smoke test or build.
         ** APPVERSION can be JIRA-ID or Sprint Version or just set it to jenkins ${env.BUILD_NUMBER}
         */
        APPVERSION = '0.0.1'
        // OR
        // APPVERSION = '0.1.${env.BUILD_NUMBER}'

        APPNAME = 'sample-node-app'
        SRVRPORT = '3000'
        DOCKERIMGNAME = 'r3pidokku/${env.APPNAME}'
        DOKKUTAGNAME = 'dokku/${env.APPNAME}:${env.APPVERSION}'
        DOKKU_URL = '${env.APPNAME}.r3pidokku'
    }

    def app
    def appcontainer

    stage('Build') {
        echo "docker.build(env.DOCKERIMGNAME:env.APPVERSION)"
        //app = docker.build("${env.DOCKERIMGNAME}:${env.APPVERSION}")
    }
    stage('SmokeTest') {
        //appcontainer = app.run("-d -p ${env.SRVRPORT}:3000")
        //sh 'curl http://localhost:$SRVRPORT | grep "<title>R3PI</title>"'
        //appcontainer.stop
    }
    stage('PushToDokku') {
        // TODO cd to git repo working folder
        //sh 'git push dokku master'
        //echo 'Push ${env.DOCKERIMGNAME}:${env.APPVERSION} to dokku as ${env.DOKKUTAGNAME}'
    }
    // stage TestOnDokku is a more rigourous test of app.
    // This is where test cases for the hotfix or feature is tested and if passed it 
    // may be a potential RELEASE-CANDIDATE build for release to production.
    stage('TestOnDokku') {
        sh 'curl http://$DOKKU_URL | grep "<title>R3PI</title>"'
        //sh 'curl http://13.59.184.72 | grep "<title>R3PI</title>"'
    }
}
