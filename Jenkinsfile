pipeline {
    agent any
    
    environment {
        // Spécifie l'URL de l'application à déployer
        APP_URL = 'https://github.com/fabienboy661/k8s-jenkins-project.git'
        // Spécifie le nom de votre application Kubernetes
        APP_NAME = 'my-app'
        // Spécifie le chemin vers le dossier de votre application React
        APP_DIR = '/home/fabien/Pratique-jenkins/my-react-app'
    }
    
    stages {
        stage('Build') {
            steps {
                sh 'git clone $APP_URL'
                dir("$APP_DIR") {
                    sh 'npm install'
                }
            }
        }
        stage('Test') {
            steps {
                dir("$APP_DIR") {
                    sh 'npm test'
                }
            }
        }
        stage('Deploy to Minikube') {
            steps {
                dir("$APP_DIR") {
                    // Déployer le déploiement Kubernetes
                    sh 'kubectl apply -f deployment.yaml'
                    
                    // Déployer le service Kubernetes
                    sh 'kubectl apply -f service.yaml'
                }
            }
        }
    }
}
