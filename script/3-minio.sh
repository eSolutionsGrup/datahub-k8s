#!/usr/bin/env bash

cd ${BASH_SOURCE%/*}

# add helm repo
helm repo add minio https://operator.min.io/
helm repo update


#install operator
kubectl create namespace minio-operator
helm install --namespace minio-operator --generate-name minio/minio-operator

kubectl create namespace minio-tenant
kubectl apply -f minio-tenant.yaml
