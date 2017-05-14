# echo "Performing rolling update for deployment $deployment using image ${DOCKER_IMAGE_NAME}"
#   (kubectl rollout status deployment/${deployment} --namespace ${K8S_NAMESPACE} && \
#     kubectl set image deployment/${deployment} --namespace ${K8S_NAMESPACE} ${container}=${DOCKER_IMAGE_NAME}) || \
#     echo "Warning: Ignoring rolling update"
export PATH=$PATH:/home/circleci/google-cloud-sdk/bin

K8S_TAG=$(git rev-parse --short HEAD)

echo "K8S_TAG ${K8S_TAG}"

# kubectl patch deployment $K8S_CONTAINER -p '{"spec":{"template":{"spec":{"containers":[{"name":"$K8S_CONTAINER","image":"$DOCKER_IMAGE_NAME:'"$K8S_TAG"'"}]}}}}'
kubectl patch rc $K8S_CONTAINER -n staging -p '{"spec":{"template":{"spec":{"containers":[{"name":"$K8S_CONTAINER","image":"$DOCKER_IMAGE_NAME:'"$K8S_TAG"'"}]}}}}'
