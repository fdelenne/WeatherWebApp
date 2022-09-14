pipeline{
    
    agent any
    
    stages{
        
        stage('checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/fdelenne/WeatherWebApp']]])
            }
        }
        
        stage('stop previous containers'){
            steps{
                sh 'docker ps -f name=imageapi -q | xargs --no-run-if-empty docker container stop'
                sh 'docker container ls -a -fname=imageapi -q | xargs -r docker container rm'
            }
        }
        
        stage('docker run'){
            steps{
                script{
                     sh 'docker run -d -p 5000:80 --rm --name imageapi ' + imageName
                }
            }
        }
        
        stage('docker build'){
            steps{
                script{
                    dockerImage = docker.build imageName
                }
            }
        }
        
        stage('push to ECR'){
            steps{
                script{
                    docker.withRegistry('113304117666.dkr.ecr.us-west-1.amazonaws.com', 'ecr:us-west-1:aws-credentials'){
                        dockerImage.push("latest")
                    }
                }
            }
        }
        
    }
    
}