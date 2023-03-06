#!/bin/bash
sed -i 's/status_page_image:status_page/status_page_image:status_page/g' /home/ubuntu/kube_config/deployment.yml
kubectl apply -f /home/ubuntu/kube_config/deployment.yml
kubectl apply -f /home/ubuntu/kube_config/service.yml
while true; do
  running=$(kubectl get pods --field-selector=status.phase=Running | grep -c Running)
  desired=$(kubectl get deployment project-deployment -o=jsonpath='{.spec.replicas}')

  if [ "$running" -eq "$desired" ]; then
    echo "All pods are running!"
    break
  fi

  echo "Waiting for all pods to be running..."
  sleep 5
done
