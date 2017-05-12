#!/bin/bash

apt-get install -y python2.7

wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-153.0.0-linux-x86_64.tar.gz

tar -xzf google-cloud-sdk-153.0.0-linux-x86_64.tar.gz -C /home/circleci

/home/circleci/google-cloud-sdk/install.sh --usage-reporting false --command-completion true --additional-components alpha beta --quiet

export PATH=$PATH:/home/circleci/google-cloud-sdk/bin

echo "Setting up google cloud sdk..."
echo ${GCLOUD_SERVICE_KEY} | base64 --decode -i > ${HOME}/account-auth.json
gcloud --quiet components update
gcloud --quiet components update kubectl
gcloud auth activate-service-account --key-file ${HOME}/account-auth.json
gcloud config set project ${GCLOUD_PROJECT_NAME}
# gcloud --quiet config set container/cluster ${GCLOUD_CLUSTER_NAME}
# gcloud config set compute/zone ${GCLOUD_COMPUTE_ZONE}
# gcloud config set container/use_client_certificate True
# gcloud --quiet container clusters get-credentials ${GCLOUD_CLUSTER_NAME}
