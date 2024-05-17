#!/bin/bash

echo "Logging into EC2 instance"
ssh -i /Users/trivikram/Developer/mumbai-kp1.pem ubuntu@3.110.41.80 <<EOF

echo "Logging into docker"
sudo docker login -u trivikram97 -p hdsfjk

echo "Pulling image"
sudo docker pull trivikram97/capstone-prod:latest

echo "Docker images on EC2:"
sudo docker images

EOF
echo "Deployment completed!"
