#!/usr/bin/env bash

cd ${BASH_SOURCE%/*}

kubectl create namespace zeppelin

kubectl apply -f zeppelin-server.yaml
