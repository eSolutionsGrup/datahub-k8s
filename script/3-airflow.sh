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


######## TBD ##########

#[2021-04-27 08:21:57,522] {taskinstance.py:1455} ERROR - Exception when calling -> create_custom_object: (403)
#Reason: Forbidden
#HTTP response headers: HTTPHeaderDict({'Cache-Control': 'no-cache, private', 'Content-Type': 'application/json', 'X-Content-Type-Options': 'nosniff', 'Date': 'Tue, 27 Apr 2021 08:21:57 GMT', 'Content-Length': '398'})
#HTTP response body: {"kind":"Status","apiVersion":"v1","metadata":{},"status":"Failure","message":"sparkapplications.sparkoperator.k8s.io is forbidden: User \"system:serviceaccount:airflow:airflow\" cannot create resource \"sparkapplications\" in API group \"sparkoperator.k8s.io\" in the namespace \"spark-apps\"","reason":"Forbidden","details":{"group":"sparkoperator.k8s.io","kind":"sparkapplications"},"code":403}



# kubectl create clusterrolebinding cluster-admin \
#  --clusterrole=cluster-admin \
#  --serviceaccount=airflow:airflow 




# kubectl create serviceaccount airflow --namespace=spark-apps

# kubectl create clusterrolebinding airflow-spark-role \
#  --clusterrole=edit \
#  --serviceaccount=airflow:airflow \
#  --namespace=spark-apps


# kubectl create clusterrolebinding airflow-admin \
#  --clusterrole=cluster-admin \
#  --serviceaccount=airflow:airflow \
#  --namespace=spark-apps 





# kubectl create serviceaccount airflow --namespace=spark-operator
# kubectl create clusterrolebinding airflow-operator-role \
#  --clusterrole=edit \
#  --serviceaccount=spark-operator:airflow \
#  --namespace=spark-operator




# kubectl create clusterrolebinding airflow-admin \
#  --clusterrole=cluster-admin \
#  --serviceaccount=airflow:airflow \
#  --namespace=spark-apps 

