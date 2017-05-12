#!/bin/bash

# sudo /opt/google-cloud-sdk/bin/gcloud --quiet components update kubectl
# sudo -E env "PATH=$PATH" gcloud --quiet components update kubectl

apt-get install -y python2.7

wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-153.0.0-linux-x86_64.tar.gz

tar -xzf google-cloud-sdk-153.0.0-linux-x86_64.tar.gz -C /home/circleci

# ls /home/circleci/google-cloud-sdk/ -la

/home/circleci/google-cloud-sdk/install.sh --usage-reporting false --command-completion true --additional-components alpha beta --quiet


export PATH=$PATH:/home/circleci/google-cloud-sdk/bin

# echo $PATH

# gcloud --quiet components update kubectl

# kubectl help

# gcloud container clusters get-credentials <your-cluster>

# Auth gcloud
# echo $CLIENT_SECRET | base64 --decode > ${HOME}/client-secret.json
# gcloud auth activate-service-account --key-file ${HOME}/client-secret.json

# Init kubectl, sudo is required :/
gcloud --quiet components update kubectl
# gcloud config set compute/zone europe-west1-c
# gcloud config set project my-project
# gcloud container clusters get-credentials trace

kubectl help

# docker version
