#!/usr/bin/env bash

#Installs "god" tiller into tools namespaces
helm init --tiller-namespace kuberchaun-tools --service-account tiller

#Sealed secrets cluster bits -> https://github.com/bitnami-labs/sealed-secrets
release=$(curl --silent "https://api.github.com/repos/bitnami-labs/sealed-secrets/releases/latest" | sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p')
kubectl create -f https://github.com/bitnami-labs/sealed-secrets/releases/download/$release/sealedsecret-crd.yaml