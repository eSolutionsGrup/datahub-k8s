#!/usr/bin/env bash

kubectl --namespace zeppelin port-forward svc/zeppelin-server 8181:80