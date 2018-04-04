/*
 ** Ideally these vars be set at Jenkins job level and passed down as environment / build parameters.
 ** This way multiple docker containers can be run in parallel testing away on a CI server to ensure
 ** that every commit / push does not break the smoke test or build.
 ** APPVERSION can be JIRA-ID or Sprint Version or just set it to jenkins ${env.BUILD_NUMBER}
 */
env.APPVERSION = '0.0.1'
// OR
// env.APPVERSION = "0.1.BUILD_NUMBER"

env.APPNAME = 'sample-node-app'
env.SRVRPORT = '3000'
env.DOKKU_URL = "APPNAME.r3pidokku"
env.DOCKERIMGNAME = "r3pidokku/APPNAME"
env.DOKKUTAGNAME = "dokku/APPNAME:APPVERSION"

node {

    def app
    def appcontainer

    stage('Clone repository') {
		checkout scm
    }
    stage('Build image') {
        echo "docker.build(DOCKERIMGNAME:APPVERSION)"
        app = docker.build('r3pidokku/sample-node-app:0.0.1')
    }
    stage('SmokeTest Image') {
        appcontainer = app.run("-d -p env.SRVRPORT:3000")
        sh 'curl -s http://localhost:$SRVRPORT | grep "<title>R3PI</title>"'
        appcontainer.stop
    }
    stage('Push Image to Dokku') {
        // TODO cd to git repo working folder
        //sh 'git push dokku master'
        //echo 'Push ${env.DOCKERIMGNAME}:${env.APPVERSION} to dokku as ${env.DOKKUTAGNAME}'
    }
    // stage TestOnDokku is a more rigourous test of app.
    // This is where test cases for the hotfix or feature is tested and if passed it 
    // may be a potential RELEASE-CANDIDATE build for release to production.
    stage('Test Image on Dokku') {
        sh 'curl http://$DOKKU_URL | grep "<title>R3PI</title>"'
        //sh 'curl http://13.59.184.72 | grep "<title>R3PI</title>"'
    }
}
