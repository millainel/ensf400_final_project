pipeline {
    agent any

    triggers {
        githubPullRequest {
            events ['opened', 'reopened', 'synchronize'] 
        }
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t myapp .'
                }
            }
        }
    }
}
