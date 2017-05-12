#!/bin/bash

# sudo /opt/google-cloud-sdk/bin/gcloud --quiet components update kubectl
# sudo -E env "PATH=$PATH" gcloud --quiet components update kubectl

apt-get install -y python2.7

wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-153.0.0-linux-x86_64.tar.gz

tar -xzf google-cloud-sdk-153.0.0-linux-x86_64.tar.gz -C /home/circleci/google-cloud-sdk

ls /home/circleci/google-cloud-sdk/ -la

# /home/circleci/google-cloud-sdk/install.sh --usage-reporting false --command-completion true --additional-components alpha beta --quiet


# export PATH=$PATH:/home/circleci/google-cloud-sdk/bin

# # echo $PATH

# gcloud --quiet components update kubectl

# kubectl help
