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

TOKEN=prA5ahie3ohtoo4boogvre6quipheaTh
CERT_PATH=/var/lib/kubernetes/certs
curl \
  --header "Authorization: Bearer $TOKEN" \
  --cert $CERT_PATH/kubernetes.pem \
  --key $CERT_PATH/kubernetes-key.pem \
  --cacert $CERT_PATH/ca.pem \
  https://master0.k8s.lan:6443/healthz
