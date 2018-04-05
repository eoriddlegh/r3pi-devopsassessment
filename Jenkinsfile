#!groovy
/*
 ** Ideally these vars be set at Jenkins job level and passed down as environment or build parameters.
 ** This way multiple docker containers can be run in parallel testing away on a CI server to ensure
 ** that every commit or push does not break the smoke test or build.
 ** APPVERSION can be JIRA-ID or Sprint Version or just set it to jenkins ${env.BUILD_NUMBER}
 */
env.APPVERSION = "0.0.1"
// OR
// env.APPVERSION = "0.1.BUILD_NUMBER"

env.APPNAME = "sample-node-app"
env.SRVRPORT = "3000"
env.DOKKU_URL ="${env.APPNAME}.r3pidokku"
env.DOCKERIMGNAME = "r3pidokku/${env.APPNAME}"
env.DOKKUTAGNAME = "dokku/${env.APPNAME}:${env.APPVERSION}"
// docker inspect --format '{{ .NetworkSettings.Networks.bridge.IPAddress }}' <containerid>
env.APPIPADDR = "172.17.0.3"

node {

    def app
    def appcontainer

    stage('Clone repository') {
        checkout scm
    }
    stage('Build image') {
        def apptag = "${env.DOCKERIMGNAME}:${env.APPVERSION}"
        print "Docker Image will be : ${env.DOCKERIMGNAME}:${env.APPVERSION}"
        app = docker.build(apptag)
    }
    stage('SmokeTest Image') {
        appcontainer = app.run("--rm -p ${env.SRVRPORT}:3000")
        // Had to do this for docker for windows it is not working the same as in linux
        // sh "docker inspect --format '{{ .NetworkSettings.Networks.bridge.IPAddress }}' appcontainer.id"
        // sh 'curl -s http://$APPIPADDR:$SRVRPORT | grep "<title>R3PI</title>"'
        // this issue is intermittent on windows.  I restarted box now it workw with localhost
        def curlcmd = "sudo curl --silent --show-error http://${env.APPIPADDR}:${env.SRVRPORT} | grep '<title>R3PI</title>'"
        sh curlcmd
        appcontainer.stop
    }
    stage('Push Image to Dokku') {
        // TODO cd to git repo working folder
        //sh 'git push dokku master'
        //echo 'Push ${env.DOCKERIMGNAME}:${env.APPVERSION} to dokku as ${env.DOKKUTAGNAME}'
    }
    // stage Test Image On Dokku is a more rigourous test of app.
    // This is where test cases for the hotfix or feature is tested and if passed it 
    // may be a potential RELEASE-CANDIDATE build for release to production.
    stage('Test Image on Dokku') {
        sh 'curl -s http://$DOKKU_URL | grep "<title>R3PI</title>"'
        //sh 'curl http://13.59.184.72 | grep "<title>R3PI</title>"'
    }
}
