export PATH=$PATH:/home/circleci/google-cloud-sdk/bin

docker build --build-arg NPM_TOKEN=${NPM_TOKEN} -t ${DOCKER_IMAGE_NAME}:$(git rev-parse --short HEAD) .

# Build and push docker image
gcloud docker -- push ${DOCKER_IMAGE_NAME}:$(git rev-parse --short HEAD)
