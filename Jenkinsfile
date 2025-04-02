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
                    sh 'docker build -t myapp .'
                }
            }
        }

        stage('Install Docker Compose') {
            steps {
                script {
                    // Install Docker Compose dynamically
                    sh '''
                    curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
                    chmod +x /usr/local/bin/docker-compose
                    '''
                }
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                script {
                    sh 'docker-compose -f docker-compose-deploy.yml up -d'
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    sh 'docker-compose -f docker-compose-deploy.yml down'
                    sh 'docker system prune -f'
                }
            }
        }
    }
}
