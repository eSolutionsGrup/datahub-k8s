#!/usr/bin/env bash

cd ${BASH_SOURCE%/*}

# new install
# https://docs.min.io/minio/k8s/reference/minio-kubectl-plugin.html
#
kubectl minio init \
        --image minio/operator:v4.3.4 \
        --console-image minio/console:v0.12.1 \
        --default-console-image minio/console:v0.12.1 \
        --default-console-image RELEASE.2021-11-03T03-36-36Z

        
kubectl minio proxy -n minio-operator


kubectl create namespace minio-tenant
# kubectl minio tenant create minio-tenant --namespace minio-tenant --storage-class local-storage --capacity 10Gi --servers 4 --volumes 4

kubectl minio tenant create minio-tenant \
        --namespace minio-tenant \
        --capacity 10Gi \
        --servers 4 \
        --volumes 4






# add helm repo
# helm repo add minio https://operator.min.io/
# helm repo update


#install operator
# kubectl create namespace minio-operator
# helm install --namespace minio-operator --generate-name minio/minio-operator

# kubectl create namespace minio-tenant
# kubectl apply -f minio-tenant.yaml
