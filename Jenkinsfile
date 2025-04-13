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
            script{
                scannerHome = tool 'SonarScanner 3.0';
            } 
            withSonarQubeEnv() { // If you have configured more than one global server connection, you can specify its name
                sh "${scannerHome}/bin/sonar-scanner"
            }
        }

    }

   
}
