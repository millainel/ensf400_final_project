pipeline {
    agent {
        docker { image 'gradle:7-jdk11' }
    }
    stages {
        stage('Verify Docker') {
            steps {
                sh 'docker --version'
            }
        }
        stage('Build') {
            steps {
                sh './gradlew build'
            }
        }
    }
}
