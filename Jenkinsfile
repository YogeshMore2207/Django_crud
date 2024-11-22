pipeline {
    agent any

    environment {
        VIRTUAL_ENV = 'env'            // Virtual environment directory
        PYTHON = 'python3'             // Python executable
        PIP = 'pip'                    // Pip command
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], userRemoteConfigs: [[credentialsId: 'Github', url: 'https://github.com/YogeshMore2207/Django_crud.git']]) // Replace with your actual GitHub repository URL
            }
        }
        
        stage('Set up Python environment') {
            steps {
                script {
                    // Create virtual environment if it does not exist
                    if (!fileExists(VIRTUAL_ENV)) {
                        sh "${PYTHON} -m venv ${VIRTUAL_ENV}"
                    }
                }
            }
        }

        stage('Install dependencies') {
            steps {
                script {
                    // Activate virtual environment and install dependencies
                    sh """
                        bash -c "source ${VIRTUAL_ENV}/bin/activate"
                        pip install --break-system-packages -r requirements.txt
                    """
                }
            }
        }

        stage('Run Migrations') {
            steps {
                script {
                    // Run database migrations for Django
                    sh """
                        bash -c "source env/bin/activate"
                        ${PYTHON} manage.py migrate
                    """
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Run tests for the Django project
                    sh """
                        bash -c "source env/bin/activate"
                        ${PYTHON} manage.py test
                    """
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image if the project uses Docker
                    sh 'docker build -t neew .'
                }
            }
        }

        stage('Deploy to Server') {
            steps {
                script {
                    // Deploy the app (this could be an SSH deployment, Docker container run, etc.)
                    // Assuming you deploy via Docker
                    sh """
                        docker run -d --name neew -p 9000:9000 neew
                    """
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed.'
            // Clean up if necessary (e.g., removing Docker containers or stopping services)
        }
        success {
            echo 'Pipeline ran successfully.'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
