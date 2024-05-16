pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                echo 'Checking out from github'
                checkout scmGit(branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/3vkrum/Capstone']])
                
            }
        }
        
        stage('Build docker image'){
            steps{
                script{
                    //sh 'docker build -t trivikram97/capstone-img .'
                    sh './build.sh' 

                }
            }
        }
        
        stage('Push image to hub'){
            steps{
                script{
                    sh 'docker tag trivikram97/capstone-img trivikram97/capstone-dev:latest'
                    sh 'docker login -u trivikram97 -p ThinkBig!##'
                    sh 'docker push trivikram97/capstone-dev:latest'
                }
            }
        }
    }
}
