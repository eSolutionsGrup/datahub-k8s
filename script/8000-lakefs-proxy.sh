#!/usr/bin/env bash

# export POD_NAME=$(kubectl get pods --namespace lakefs -o jsonpath="{.items[0].metadata.name}")

echo "Visit http://127.0.0.1:8000/setup to use your application"

kubectl port-forward svc/my-lakefs 8000:80 --namespace lakefs
