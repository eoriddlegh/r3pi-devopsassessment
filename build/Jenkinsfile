node {
    def dkimage = image("$DOCKERIMGNAME:$APPVERSION")
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
        DOCKERIMGNAME = 'r3pidokku/$APPNAME'
        DOKKUTAGNAME = 'dokku/$APPNAME:$APPVERSION'
        DOKKU_URL = '$APPNAME.r3pidokku'
    }
    stage('Build') {
        //sh 'docker build -t $DOCKERIMGNAME:$APPVERSION .'
        dkimage = docker.build(dkimage)
    }
    stage('SmokeTest') {
        //sh 'docker run --rm -p ${env.SRVRPORT}:3000 -d ${env.DOCKERIMGNAME}:${env.APPVERSION}'
        def dkcontainer = dkimage.run("-d -p $SRVRPORT:3000")
        sh 'curl http://localhost:$SRVRPORT | grep "<title>R3PI</title>"'
        //sh 'docker stop $(docker ps | grep $DOCKERIMGNAME$APPVERSION | awk '{print $1}')'
        dkcontainer.stop
    }
    stage('PushToDokku') {
        // TODO cd to git repo working folder
        //sh 'git push dokku master'
        echo 'Push $DOCKERIMGNAME:$APPVERSION to dokku as dokku/sample-node-app:$APPVERSION'
    }
    // stage TestOnDokku is a more rigourous test of app.
    // This is where test cases for the hotfix or feature is tested and if passed it 
    // may be a potential RELEASE-CANDIDATE build for release to production.
    stage('TestOnDokku') {
        sh 'curl http://$DOKKU_URL | grep "<title>R3PI</title>"'
        //sh 'curl http://13.59.184.72 | grep "<title>R3PI</title>"'
    }
}
