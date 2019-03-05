.PHONY: clean destroy master-ip kubectl-conf

# create a vm rinning k3s 
instance: 
	vagrant up
	rm -rf ./tmp

# destroy the k8s cluster
destroy:
	vagrant destroy --force

# configure kubectl conf env var
kubectl-conf:
	echo "Execute the following:" 
	export KUBECONFIG=${PWD}/.kube/config

cluster-info: kubectl-conf
	kubectl cluster-info

vm-status:
	vagrant status

# clean the workspace
clean: destroy
	rm -rf  ./.kube/
