#!/usr/bin/env bash

# Install snap
# sudo apt install snapd

# Install microk8s
#
# Latest version
sudo snap install microk8s --classic
#
# Specific version
# sudo snap install microk8s --channel=1.17/stable --classic

# Add current user to the group
# -> probably have to logout/in to take effect
sudo usermod -a -G microk8s $USER

# kubectl
#
# Use the microk8s version (via alias for convenience)
# alias kubectl='microk8s.kubectl'
# Install latest version
# curl -Lo $HOME/.local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x $HOME/.local/bin/kubectl
# Install specific version - v1.17
# sudo snap install kubectl --channel=1.17/stable --classic

# kubectl config
microk8s config >${HOME}/.kube/config

# kubectl bash completion
# echo "source <(kubectl completion bash)" >>$HOME/.bash_completion

# core extensions
microk8s enable dns ingress

# LoadBalancer - prompts for more info
microk8s enable metallb

# kube config
microk8s config >$HOME/.kube/config

# shpod
# kubectl apply -f https://k8smastery.com/shpod.yaml
# kubectl attach --namespace=shpod -ti shpod
# kubectl delete -f https://k8smastery.com/shpod.yaml
