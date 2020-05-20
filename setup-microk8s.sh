#!/usr/bin/env bash

# Install snap
sudo apt install snapd

# Install microk8s
#
# Latest version
sudo snap install microk8s --classic
#
# Specific version
sudo snap install microk8s --channel=1.17/stable --classic

# Add current user to the group
sudo usermod -a -G microk8s $USER

# Alias for .bashrc
alias kubectl='microk8s.kubectl'

# core extensions
microk8s enable dns dashboard ingress

# LoadBalancer - prompts for more info
microk8s enable metallb

# shpod
kubectl apply -f https://k8smastery.com/shpod.yaml
kubectl attach --namespace=shpod -ti shpod
kubectl delete -f https://k8smastery.com/shpod.yaml
