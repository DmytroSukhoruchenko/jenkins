pipeline {
    agent any

    stages {
        stage('make image') {
            steps {
                dir ('') {
                    sh 'docker build -t myfirstdockercraft/simplewhalejenkins:v1 . '
                }
            }
        }
        stage('push') {
            steps {
                sh 'docker push myfirstdockercraft/simplewhalejenkins:v1'
            }
        }
        stage('deploy kuber') {
            steps {
                echo 'moving the code into working environment or making the artifact'
                            
            }
        }
        
    }
    
}
