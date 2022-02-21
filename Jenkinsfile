pipeline {
    agent any

    stages {
        stage("docker auth") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker login -u $USERNAME -p $PASSWORD'
                }
            }
        }    
                
        stage('make image') {
            steps {
                dir ('') {
                    sh 'docker build -t myfirstdockercraft/simplewhalejenkins:n${BUILD_NUMBER} . '
                }
            }
        }
        stage('push') {
            steps {
                sh 'docker push myfirstdockercraft/simplewhalejenkins:n${BUILD_NUMBER}'
            }
        }
        stage('deploy kuber') {
            steps {
                // echo 'moving the code into working environment or making the artifact'
                withKubeConfig(credentialsId: 'jenkube', serverUrl: '') {
                script {
                    sh 'kubectl apply -f /home/dmitriy/kuber/deployfront.yaml'
                    //kubernetesDeploy(configs: "deployfront.yaml", kubeconfigId: "kuber") 
                    }                
                } 
            }
        }
        stage('cleanup') {
            steps {
                sh 'docker rmi myfirstdockercraft/simplewhalejenkins:n${BUILD_NUMBER}'
            }
        }
    }
    
}
