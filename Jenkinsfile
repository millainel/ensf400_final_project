pipeline {
    agent any

    // triggers {
    //     // Listen to GitHub pull request events for triggering the build
    //     githubPullRequest()
    // }

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
