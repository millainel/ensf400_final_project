pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t myapp .'
                }
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                script {
                    // Deploy using Docker Compose
                    sh 'docker-compose -f docker-compose-deploy.yml up -d'
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Clean up Docker containers after deploy (optional)
                    sh 'docker-compose -f docker-compose-deploy.yml down'
                    sh 'docker system prune -f'
                }
            }
        }
    }

   
}
