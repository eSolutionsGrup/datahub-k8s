#!/usr/bin/env bash

# Add the lakeFS Helm repository
helm repo add lakefs https://charts.lakefs.io


kubectl create namespace lakefs

# Deploy lakeFS with helm release "my-lakefs"
helm install --namespace lakefs my-lakefs lakefs/lakefs