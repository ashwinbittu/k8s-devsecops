#!/bin/bash

echo "before sleep"
sleep 120
echo "after sleep"

kubectl get ns
kubectl -n dev  get deploy 


if [[ $(kubectl -n dev  rollout status deploy ${deploymentName} --timeout 5s) != *"successfully rolled out"* ]]; 
then     
	echo "Deployment ${deploymentName} Rollout has Failed"
    kubectl -n dev rollout undo deploy ${deploymentName}
    exit 1;
else
	echo "Deployment ${deploymentName} Rollout is Success"
fi