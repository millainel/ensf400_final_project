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
                    sh 'docker build -t myapp -f myapp.Dockerfile .'
                }
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                script {
                     sh '''
                        docker stop myapp || true
                        docker rm myapp || true
                        docker run -d --name myapp -p 9090:8080 myapp
                     '''
                }
            }
        }
        stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('static'){
                    sh './gradlew sonarqube'
                }
                script{
                    qualityGate = waitForQualityGate()
                    if qualityGate.status != 'OK' {
                        error "Quality gate failed: ${qualityGate.status}"
                    } else {
                        echo "Quality gate passed: ${qualityGate.status}"
                    }
                }

            }
        }

    }

   
}
