# rpi-k3s

K3s setup in a raspberry pi. Using this repo to keep the whole of my configuration as code

## How I set it up

After flashing the raspberry with raspbian 32 bits, I got to configure for each one of them

``` bash
# After mounting `system-boot` on the master node
./generate-user-data.bash master 

# After mounting `system-boot` on the master node
./generate-user-data.bash worker
```

This will set the config needed for cloud-init to kick-in at boot time and configure the wpa supplicant to connect them to my dedicated wifi network for them. 

I'm storing the passwords and kube tokens through [pass](https://www.passwordstore.org/), the GPG-based standard unix password manager

# Setting them up
I went to set them up with the following

``` ansible
ansible-playbook -i inventory.yaml playbook.yaml -K
```

# Future work
I want the clean instalation to setup ArgoCD to reconciliate my k8s manifest

``` bash
kubectl create namespace argocd
helm repo add argo https://argoproj.github.io/argo-helm
helm install argocd argo/argo-cd --namespace argocd
```
