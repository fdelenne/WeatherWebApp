pipeline{
    agent any
    environment{
        registry = "113304117666.dkr.ecr.us-west-1.amazonaws.com/weather-deployment"
        imageName = "imageapi"
        buildTag = "${BUILD_NUMBER}"
        dockerImage = ''
    }
    stages{
        stage('checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/fdelenne/WeatherWebApp']]])
            }
        }
        stage('stop previous containers'){
            steps{
                sh 'docker ps -f name=imageapi -q | xargs --no-run-if-empty docker container stop'
                sh 'docker container ls -a -fname=imageapi -q | xargs -r docker container rm'
            }
        }
        stage('docker build'){
            steps{
                script{
                    dockerImage = docker.build "${imageName}:${buildTag}"
                }
            }
        }
         //stage('docker run'){
           // steps{
             //   script{
               //      sh '''
                 //    docker rm --force weatherapi
                   //  docker run -d -p 5000:80 --rm --name weatherapi imageapi
                    // '''
              //  }
        //    }
        // }
        
        stage('push to ECR'){
            steps{
                script{

                    sh 'aws ecr get-login-password --region us-west-1 | docker login --username AWS --password-stdin 113304117666.dkr.ecr.us-west-1.amazonaws.com'
                    sh 'docker image tag ${imageName}:${buildTag} 113304117666.dkr.ecr.us-west-1.amazonaws.com/weather-deployment:${buildTag}'
                    sh 'docker push 113304117666.dkr.ecr.us-west-1.amazonaws.com/weather-deployment:${buildTag}'
                } 
            }
        } 
        
         stage('deploy EKs cluster'){
            steps{
                script{

                    sh 'aws sts get-caller-identity'
                    sh 'aws eks update-kubeconfig --region us-west-1  --name weathercluster'
                    //sh 'kubectl get svc'
                    //sh 'kubectl get nodes'
                    //sh 'kubectl get pods'
                    sh 'kubectl get namespace'

                    sh 'sed -i "s;latest;$buildTag;" eksdeployment.yml'
                    
                    sh 'kubectl apply -f eksdeployment.yml --record=true'
                    sh 'kubectl apply -f eks-service.yml'
                    
                    sh 'kubectl rollout restart deployment -n eks-sample-app'
                } 
            }
        } 
    }
} 