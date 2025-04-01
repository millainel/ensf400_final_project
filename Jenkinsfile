pipeline {
    agent {
        docker { image 'gradle:7-jdk11' }  
    }
    stages {
        stage('Build') {
            steps {
                sh './gradlew build'  
                }
        }
    }
}
