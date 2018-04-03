node {
    stage('Example') {
        try {
            sh 'docker --version'
            sh 'exit 1'
        }
        catch (exc) {
            echo 'Something failed, I should sound the klaxons!'
            throw
        }
    }
}
