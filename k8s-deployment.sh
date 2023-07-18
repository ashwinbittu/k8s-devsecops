#!/bin/bash

sed -i "s#replace#${imageName}#g" k8s_deployment_service.yaml

kubectl delete ns dev
kubectl create ns dev


#kubectl -n dev get deployment ${deploymentName} > /dev/null
#
# if [[ $? -ne 0 ]]; then
#     echo "deployment ${deploymentName} doesnt exist"
#     kubectl -n dev apply -f k8s_deployment_service.yaml
# else
#     echo "deployment ${deploymentName} exist"
#     echo "image name - ${imageName}"
#     kubectl -n dev set image deploy ${deploymentName} ${containerName}=${imageName} --record=true
# fi


kubectl -n dev apply -f k8s_deployment_service.yaml