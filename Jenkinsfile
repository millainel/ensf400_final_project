pipeline {
    agent any

    environment {
        // sqa_ee64ee060044c0d648b39e4307b4ba1bc5a4b667
        IMAGE_NAME = 'millainel/ensf400_final_project'
        TAG = "${GIT_COMMIT}"
        DOCKER_CREDENTIALS_ID = 'dockerhub'
        SONARQUBE_CREDENTIALS_ID = 'sonarqube'
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
                    // Build the Docker image
                    sh 'docker build -t myapp -f myapp.Dockerfile .'
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Run tests inside the Docker container
                    sh 'docker run --rm myapp ./gradlew test'
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

                withSonarQubeEnv('sonarqube') { // Replace with your SonarQube server name
                    sh './gradlew sonarqube'
                    
                }
                script{
                    qualityGate = waitForQualityGate()
                    if (qualityGate.status != 'OK') {
                        error "Quality gate failed: ${qualityGate.status}"
                    } else {
                        echo "Quality gate passed: ${qualityGate.status}"
                    }
                }

            }
        }

    }

   
}