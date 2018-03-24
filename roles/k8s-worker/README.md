/etc/cni/net.d/kube.conf
{
    "cniVersion": "0.5.2",
    "name": "mynet",
    "type": "bridge",
    "bridge": "cni0",
    "isGateway": true,
    "ipMasq": true,
    "ipam": {
        "type": "host-local",
        "subnet": "10.200.0.0/16"
    }
}