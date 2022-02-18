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
                script {
                    kubernetesDeploy(configs: "deployfront.yaml", kubeconfigId: "kuber") /*  {
                    // sh '''
                        cd k8s-helm
                        helm upgrade --install default --set container.frontImage=myfirstdockercraft/simplewhalejenkins:n${BUILD_NUMBER} ./
                        '''  */
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
