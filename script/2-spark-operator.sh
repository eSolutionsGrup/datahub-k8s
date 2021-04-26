#!/usr/bin/env bash

kubectl create namespace spark-operator
kubectl create namespace spark-apps

kubectl create serviceaccount spark --namespace=spark-operator
kubectl create serviceaccount spark --namespace=spark-apps

kubectl create clusterrolebinding spark-operator-role \
 --clusterrole=edit \
 --serviceaccount=spark-operator:spark \
 --namespace=spark-operator

kubectl create clusterrolebinding spark-apps-role \
 --clusterrole=edit \
 --serviceaccount=spark-apps:spark \
 --namespace=spark-apps

helm repo add spark-operator https://googlecloudplatform.github.io/spark-on-k8s-operator

helm install spark spark-operator/spark-operator \
 --namespace spark-operator \
 --set enableWebhook=true,sparkJobNamespace=spark-apps,logLevel=3

kubectl get all -n spark-operator