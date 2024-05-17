#!/bin/bash
echo "Logging into EC2 instance"
ssh -i /Users/trivikram/Developer/mumbai-kp1.pem  ubuntu@3.110.41.80
echo "Logging into docker"
docker login -u trivikram97 -p ThinkBig!##
echo "Pulling image"
docker pull trivikram97/capstone-prod:latest
