#!/usr/bin/env bash


# get JWT for logging in to the console
kubectl get secret $(kubectl get serviceaccount console-sa --namespace minio-operator -o jsonpath="{.secrets[0].name}") --namespace minio-operator -o jsonpath="{.data.token}" | base64 --decode

echo

#port forward
kubectl --namespace minio-operator port-forward svc/console 9090:9090