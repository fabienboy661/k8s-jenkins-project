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
        stage('Clean workspace') {
            steps {
                // Supprimer le répertoire de travail existant
                deleteDir()
            }
        }
        
        stage('Build') {
            steps {
                // Cloner le référentiel Git
                sh "git clone $APP_URL $APP_DIR"
                
                // Aller dans le répertoire de l'application
                dir("$APP_DIR") {
                    // Installer les dépendances
                    sh 'npm install'
                }
            }
        }
        
        stage('Test') {
            steps {
                // Aller dans le répertoire de l'application
                dir("$APP_DIR") {
                    // Exécuter les tests
                    sh 'npm test'
                }
            }
        }
        
        stage('Deploy to Minikube') {
            steps {
                // Aller dans le répertoire de l'application
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
