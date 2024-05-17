#!/bin/bash

echo "Logging into EC2 instance"
ssh -i /Users/trivikram/Developer/mumbai-kp1.pem -o StrictHostKeyChecking=no ubuntu@13.127.178.196 <<EOF

echo "Logging into docker"
sudo docker login -u trivikram97 -p ThinkBig!##

echo "Pulling image"
sudo docker pull trivikram97/capstone-prod:latest

echo "Docker images on EC2:"
sudo docker images

docker-compose up -d 


EOF
echo "Deployment completed!"
