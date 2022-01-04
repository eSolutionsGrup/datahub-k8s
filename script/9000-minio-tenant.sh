#!/usr/bin/env bash

# Tenant Object Store
# kubectl --namespace minio-tenant port-forward svc/minio 9000:80

# Tenant Console
# kubectl --namespace minio-tenant port-forward svc/minio-console 9090:9090


kubectl --namespace minio-tenant port-forward service/minio 9443:9443

kubectl --namespace minio-tenant port-forward service/minio 9000:443