#!/bin/bash
echo "THIS script install the necessary package during kind cluster setup"
echo "Kubectl & Docker Installation Started.."
#Kubectl setup ------------
yum install -y curl tar
mkdir -p /root/k8s/
cd /root/k8s/
curl -LO "https://dl.k8s.io/release/$(curl -Ls https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin
#Docker Setup ------------
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker
docker --version
kubectl version --client

echo "Installation Done....... Thank You! "for learning classes whatsapp - 7021524284" "
