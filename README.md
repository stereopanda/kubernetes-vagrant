**3 nodes kubernetes cluster for CKA course LAB 3.X**

Kubernetes version = 1.14.1  

To start:
```bash
git clone https://github.com/stereopanda/kubernetes-vagrant.git
cd kubernetes-vagrant 
vagrant up

```

```
#master
kubeadm token create
kubeadm token list
openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'



#node
 kubeadm join --token 1srpl8.n30mku74fmhz7ac0 192.168.100.10:6443 --discovery-token-ca-cert-hash sha256:139ad659571fa19a277039ed7e

```
