echo "-- Deploy --"

export PATH=$PATH:/home/circleci/google-cloud-sdk/bin

# kubectl help # kubectl: command not found
kubectl help # kubectl: command not found

# docker version

# Build and push docker image
# docker build --build-arg NPM_TOKEN=${NPM_TOKEN} -t gcr.io/my-project/foo-service:$(git rev-parse --short HEAD) .
# gcloud docker push gcr.io/my-project/foo-service:$(git rev-parse --short HEAD)

# Update deployment's image
# for latest Kubernetes only - kubectl --namespace=staging set image deployment/subscription --container=subscription --image=gcr.io/my-project/foo-service:$(git rev-parse --short HEAD)
# path_str=$(echo '{"spec":{"template":{"spec":{"containers":[{"name":"foo","image":"gcr.io/my-project/foo-service:TAG_NAME"}]}}}}' | sed -e "s/TAG_NAME/$(git rev-parse --short HEAD)/g"); sudo kubectl --namespace=staging patch deployment foo -p $path_str --record
