pipeline {
    agent any

      triggers {
        githubPullRequest {
            prSourceBranchPattern('master')  
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
