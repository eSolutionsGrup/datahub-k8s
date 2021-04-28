#!/usr/bin/env bash

# Tenant Object Store
kubectl --namespace minio-tenant port-forward svc/minio 9000:80

# Tenant Console
#kubectl --namespace minio-tenant port-forward svc/minio-console 9091:9090
