#!/usr/bin/env bash

kubectl delete -f orders.yaml

kubectl apply -f orders.yaml