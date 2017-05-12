#!/bin/bash

# sudo /opt/google-cloud-sdk/bin/gcloud --quiet components update kubectl
sudo -E env "PATH=$PATH" gcloud --quiet components update kubectl
