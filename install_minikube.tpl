#! /bin/bash
sudo apt-get update -y
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client > version.txt
sudo apt-get update -y &&  sudo apt-get install -y docker.io
sudo docker version > docker_version.txt
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/
sudo -i
apt install conntrack
minikube start --driver=none
