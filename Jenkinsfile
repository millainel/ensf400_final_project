pipeline {
    agent {
        docker { image 'python:2-alpine' }
    }
    stages {
        stage('Build') { 
            steps {
                sh './gradelw build'
            }
        }
    }
}