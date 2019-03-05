# -*- mode: ruby -*-
# vi: set ft=ruby :

# This script to install common Kubernetes packages and is to be used
# in all VMS i.e both master and node VMs 
$script = <<-SCRIPT
# get the external ip
IPADDR=`ifconfig eth1 | grep -i mask | awk '{print $2}'| cut -f2 -d:`

# get the latest release of k3s
VERSION=`curl -w "%{url_effective}" -I -L -s -S https://github.com/rancher/k3s/releases/latest -o /dev/null | sed -e 's|.*/||'`

# download k3s 
curl -sLo /usr/local/bin/k3s -sfL https://github.com/rancher/k3s/releases/download/${VERSION}/k3s
chmod +x /usr/local/bin/k3s

# Creating /etc/systemd/system/k3s.service
tee /etc/systemd/system/k3s.service >/dev/null << "EOF"
[Unit]
Description=Lightweight Kubernetes
Documentation=https://k3s.io
After=network.target

[Service]
ExecStartPre=-/sbin/modprobe br_netfilter
ExecStartPre=-/sbin/modprobe overlay
ExecStart=/usr/local/bin/k3s server --node-ip ${IPADDR} --node-name k3s
KillMode=process
Delegate=yes
LimitNOFILE=infinity
LimitNPROC=infinity
LimitCORE=infinity
TasksMax=infinity

[Install]
WantedBy=multi-user.target
EOF

# enable k3s unit
systemctl enable k3s.service >/dev/null
systemctl daemon-reload >/dev/null

# start k3s 
systemctl start k3s.service

# wait until token file created (i.e k3s started)
while [ ! -f /var/lib/rancher/k3s/server/node-token ]; do sleep 1; done

# get the public ip address and replace in kubeconfig's localhost
sed -i "s/localhost/$IPADDR/g" /etc/rancher/k3s/k3s.yaml

# cp the k8s config in the shared folder .kube folder
mkdir -p /vagrant/.kube
cp -f /etc/rancher/k3s/k3s.yaml /vagrant/.kube/config
SCRIPT

##
#  Vagrant confiuration 
Vagrant.configure("2") do |config|
  config.vm.hostname = "k3s"
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.network "private_network", type: "dhcp"
  config.vm.provision "shell", inline: $script
end