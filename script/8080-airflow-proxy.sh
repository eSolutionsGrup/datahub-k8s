#!/usr/bin/env bash

export NAMESPACE=airflow
export POD_NAME=$(kubectl get pods --namespace $NAMESPACE -l "component=web,app=airflow" -o jsonpath="{.items[0].metadata.name}")

kubectl port-forward --namespace $NAMESPACE $POD_NAME 8080:8080