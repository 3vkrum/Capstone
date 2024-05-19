#!/bin/bash

echo "Logging into EC2 instance"
ssh -i /Users/trivikram/Developer/mumbai-kp1.pem -o StrictHostKeyChecking=no ubuntu@35.154.225.120 <<EOF

echo "Logging into docker"
sudo docker login -u trivikram97 -p thH3GNDN45IkHMng

echo "Pulling image"
sudo docker pull trivikram97/capstone-prod:latest

echo "Docker images on EC2:"
sudo docker images

docker run -d -p 8081:80 trivikram97/capstone-prod


EOF
echo "Deployment completed!"
