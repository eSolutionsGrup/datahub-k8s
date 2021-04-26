#!/usr/bin/env bash

cd ${BASH_SOURCE%/*}

helm repo add airflow-stable https://airflow-helm.github.io/charts
helm repo update

export RELEASE_NAME=airflow # set a name!
export NAMESPACE=airflow # set a namespace!
export CHART_VERSION=8.0.8 # set a version!
export VALUES_FILE=./airflow-helm-config.yaml # set your values file path!

kubectl create namespace $NAMESPACE

# Helm 3
helm install \
  $RELEASE_NAME \
  airflow-stable/airflow \
  --namespace $NAMESPACE \
  --version $CHART_VERSION \
  -f $VALUES_FILE