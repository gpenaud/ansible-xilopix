#! /bin/bash

OUTPUT_PATH=/tmp/k8s-binaries

k8s_binaries=(
  kubectl
  kube-apiserver
  kube-controller-manager
  kube-scheduler
  kube-proxy
  kubelet
)

mkdir -p ${OUTPUT_PATH}

for binary in ${k8s_binaries[@]}; do
  wget https://storage.googleapis.com/kubernetes-release/release/v1.9.6/bin/linux/amd64/${binary} --directory-prefix=${OUTPUT_PATH}
done

wget https://github.com/containernetworking/plugins/releases/download/v0.7.0/cni-plugins-amd64-v0.7.0.tgz  --directory-prefix=${OUTPUT_PATH}
wget https://get.docker.com/builds/Linux/x86_64/docker-1.12.3.tgz --directory-prefix=${OUTPUT_PATH}
wget https://github.com/coreos/etcd/releases/download/v3.0.15/etcd-v3.0.15-linux-amd64.tar.gz --directory-prefix=${OUTPUT_PATH}