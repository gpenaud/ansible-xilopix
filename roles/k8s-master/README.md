# Create a cluster of kubernetes masters instances

## tutoriel base link
https://blog.ouvrard.it/2016/12/13/kubernetes-de-zero/

# Validation commands

## etcd cluster (on master)
etcdctl \
  --endpoint=https://127.0.0.1:2379 \
  --ca-file=/var/lib/kubernetes/certs/ca.pem \
  --cert-file=/var/lib/kubernetes/certs/kubernetes.pem \
  --key-file=/var/lib/kubernetes/certs/kubernetes-key.pem \
  --no-sync \
  cluster-health

## master nodes validation (on master)
kubectl get componentstatuses