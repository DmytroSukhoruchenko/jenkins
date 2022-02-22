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
                withKubeConfig(credentialsId: 'jenkube', serverUrl: '') {
                    sh '''                        
                        sed -i "s+jenkins:n24+jenkins:n${BUILD_NUMBER}+g" /home/dmitriy/kuber/deployfront.yaml
                        kubectl replace -f /home/dmitriy/kuber/deployfront.yaml
                        '''     
                    
                }                 
            }
        }
        stage('cleanup') {
            steps {
                sh '''
                docker rmi myfirstdockercraft/simplewhalejenkins:n${BUILD_NUMBER}
                sed -i "s+jenkins:n${BUILD_NUMBER}+jenkins:n24+g" /home/dmitriy/kuber/deployfront.yaml
                '''
                
            }
        }
    }
    
}
