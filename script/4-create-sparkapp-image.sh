#!/usr/bin/env bash

cd ${BASH_SOURCE%/*}/..

mvn clean package dockerfile:build dockerfile:push

curl -s http://localhost:5000/v2/_catalog