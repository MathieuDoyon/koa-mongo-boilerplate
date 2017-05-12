#!/bin/bash

apt-get install -y python2.7

wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-153.0.0-linux-x86_64.tar.gz

tar -xzf google-cloud-sdk-153.0.0-linux-x86_64.tar.gz -C /home/circleci

/home/circleci/google-cloud-sdk/install.sh --usage-reporting false --command-completion true --additional-components alpha beta --quiet

export PATH=$PATH:/home/circleci/google-cloud-sdk/bin

echo "Setting up google cloud sdk..."
echo ${GCLOUD_SERVICE_KEY} | base64 --decode -i > ${HOME}/account-auth.json
sudo gcloud --quiet components update
sudo gcloud --quiet components update kubectl
sudo gcloud auth activate-service-account --key-file ${HOME}/account-auth.json
sudo gcloud config set project ${GCLOUD_PROJECT_NAME}
# sudo gcloud --quiet config set container/cluster ${GCLOUD_CLUSTER_NAME}
# sudo gcloud config set compute/zone ${GCLOUD_COMPUTE_ZONE}
# sudo gcloud config set container/use_client_certificate True
# sudo gcloud --quiet container clusters get-credentials ${GCLOUD_CLUSTER_NAME}
