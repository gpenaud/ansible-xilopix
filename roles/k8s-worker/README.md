
# test a container for dns resolution
CERTS_PATH=/var/lib/kubernetes/certs
API_SERVER=https://10.240.0.20:6443

kubectl \
  --server=$API_SERVER \
  --certificate-authority=$CERTS_PATH/ca.pem \
  --client-certificate=$CERTS_PATH/kubernetes.pem \
  --client-key=$CERTS_PATH/kubernetes-key.pem \
  run -i -t busybox --image=busybox --restart=Never

# local apssword - POC so no danger to git it
gpenaud:FWiephivof8onershoong1thee8tosoj