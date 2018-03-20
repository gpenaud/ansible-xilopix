
# Verification command
etcdctl \
  --endpoint=https://127.0.0.1:2379 \
  --ca-file=/var/lib/kubernetes/certs/ca.pem \
  --cert-file=/var/lib/kubernetes/certs/kubernetes.pem \
  --key-file=/var/lib/kubernetes/certs/kubernetes-key.pem \
  --no-sync \
  cluster-health
