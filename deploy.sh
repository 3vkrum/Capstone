#!/bin/bash
ssh -i /Users/trivikram/Developer/mumbai-kp1.pem  ubuntu@3.110.41.80
docker login -u trivikram97 -p ThinkBig!##
docker pull trivikram97/capstone-prod:latest
