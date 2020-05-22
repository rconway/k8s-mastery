#!/usr/bin/env bash

# Install minikube
curl -Lo $HOME/.local/bin/minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x $HOME/.local/bin/minikube

# Install kubectl
#
# Latest version
curl -Lo $HOME/.local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
  && chmod +x $HOME/.local/bin/kubectl
# Specific version - v1.17
sudo snap install kubectl --channel=1.17/stable --classic
