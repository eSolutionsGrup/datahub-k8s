#!/usr/bin/env bash

minikube mount $(builtin cd ${BASH_SOURCE%/*}; pwd)/../datashare:/datashare