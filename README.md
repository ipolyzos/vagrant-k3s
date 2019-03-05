# Vagrant-k3s

This project contains an explerimental setup of a Kubernetes single-node set up using [k3s](https://k3s.io) in an Ubuntu 16.4 Vagrant VM. Thie project aims to serve as a local playground and test environment for [k3s](https://k3s.io) and not to be used in production.

## Pre-requisites
 * **[Virtualbox 5.2.18+](https://www.virtualbox.org)**
 * **[Vagrant 2.1.4+](https://www.vagrantup.com)**

## Deployment 
 * **[k3s](https://k3s.io)** 

## How to deploy
In order to deploy a new instance execute the following command to remove the virtual machines.
```
$ make instance
```

_``
Note:
    or just `make`
``_

## Kubectl config

For the location of the config file and the _kubectl_ `export` directive please execute the following command.
```
$ make kubectl-conf
```

## Destroy

In order to destroy the running VM and clean your hypervisor, execute the following command to remove the virtual machines created for the Kubernetes cluster.
```
$ make destroy
```

## Clean-up

In order to clean your workspace both from VMS, configuration and temporary files and running VMs execute the following command.
```
make clean
```

##  License:

   Copyright 2018-2019 Ioannis Polyzos

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.