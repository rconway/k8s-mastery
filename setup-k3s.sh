#!/usr/bin/env bash

# Install k3s
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="--disable servicelb" sh -s -
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644 --disable servicelb

# Install kubectl
#
# Latest version
curl -Lo $HOME/.local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
  && chmod +x $HOME/.local/bin/kubectl
# Specific version - v1.17
sudo snap install kubectl --channel=1.17/stable --classic

# Setup kube config
mkdir -p $HOME/.kube
#sudo cat /etc/rancher/k3s/k3s.yaml > $HOME/.kube/config
sudo k3s kubectl config view --raw > $HOME/.kube/config
