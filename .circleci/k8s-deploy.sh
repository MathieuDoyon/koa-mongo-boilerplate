echo "Performing rolling update for deployment $deployment using image ${docker_tagged_image}"
  (kubectl rollout status deployment/${deployment} --namespace ${namespace} && \
    kubectl set image deployment/${deployment} --namespace ${namespace} ${container}=${docker_tagged_image}) || \
    echo "Warning: Ignoring rolling update"
