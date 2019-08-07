apt-get update && apt-get upgrade -y
apt-get install -y docker.io
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
apt-get update
apt-get install -y kubeadm=1.14.1-00 kubelet=1.14.1-00 kubectl=1.14.1-00
echo 'Environment="KUBELET_EXTRA_ARGS=--node-ip=192.168.100.11"' >> /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
systemctl daemon-reload
systemctl restart kubelet

