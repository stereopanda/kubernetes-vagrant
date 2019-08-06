apt-get update && apt-get upgrade -y
apt-get install -y docker.io
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
apt-get update
apt-get install -y kubeadm=1.14.1-00 kubelet=1.14.1-00 kubectl=1.14.1-00

wget https://tinyurl.com/yb4xturm -O rbac-kdd.yaml
wget https://tinyurl.com/y8lvqc9g -O calico.yaml

kubeadm init --kubernetes-version 1.14.1 --pod-network-cidr 192.168.0.0/16 --apiserver-advertise-address 192.168.100.10 | tee kubeadm-init.out

# kubectl config
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl cluster-info

kubectl apply -f rbac-kdd.yaml
kubectl apply -f calico.yaml

#kubectl bash_completion
kubectl completion bash > /etc/bash_completion.d/kubectl
echo "source /etc/bash_completion" >>  ~/.bashrc
echo "source <(kubectl completion bash)" >> ~/.bashrc


