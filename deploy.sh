#!/bin/bash

echo "Logging into EC2 instance"
ssh -i /Users/trivikram/Developer/mumbai-kp1.pem -o StrictHostKeyChecking=no ubuntu@15.206.149.58 <<EOF

echo "Logging into docker"
sudo docker login -u trivikram97 -p ThinkBig!##

echo "Pulling image"
sudo docker pull trivikram97/capstone-prod:latest

echo "Docker images on EC2:"
sudo docker images

docker run -d -p 8081:80 trivikram97/capstone-prod


EOF
echo "Deployment completed!"
