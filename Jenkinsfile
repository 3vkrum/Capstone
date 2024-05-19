pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                echo 'Checking out from github'
                checkout scmGit(branches: [[name: '*/main'], [name: '*/dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/3vkrum/Capstone']])
                echo env.GIT_BRANCH
            }
        }
        
        stage('Build docker image'){
            steps{
                script{
                    //sh 'docker build -t trivikram97/capstone-img .'
                    sh 'chmod +x build.sh'
                    sh './build.sh' 

                }
            }
        }
        
        stage('Push image to Dockerhub') {
    steps {
        script {
            sh 'docker tag trivikram97/capstone-img trivikram97/capstone-img:latest'

            if (env.GIT_BRANCH == 'origin/dev') {
                sh 'docker tag trivikram97/capstone-img trivikram97/capstone-dev:latest'
                sh 'docker login -u trivikram97 -p thH3GNDN45IkHMng'
                sh 'docker push trivikram97/capstone-dev:latest'
            } else if (env.GIT_BRANCH == 'origin/main') {
                sh 'docker tag trivikram97/capstone-img trivikram97/capstone-prod:latest'
                sh 'docker login -u trivikram97 -p thH3GNDN45IkHMng'
                sh 'docker push trivikram97/capstone-prod:latest'
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
                
            } else {
                echo "Skipping Docker push - Unrecognized branch: ${env.GIT_BRANCH}"
            }
        }
    }
}

    }
}
