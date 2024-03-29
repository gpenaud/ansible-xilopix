### Why this repository ?
A simple way to centralize my work on ansible kubernetes poc, and all others deployment processes I made with ansible

### Projects
- kubernetes mini poc (2 nodes - 1 master/worker, 1 worker)
- kubernetes production/simulation poc (6 nodes - 2 haproxies, 2 masters, 2 workers)
- cfssl certificates management
- etcd

### Example hostvars variables
Here are useful ansible facts variables - cool, isn't it ?

```
# Example hostvars variables
inventory_hostname:         master0.k8s.lan
inventory_hostname_short:   master0
ansible_fqdn:               master0.k8s.lan
ansible_hostname:           master0
ansible_domain:             k8s.lan
ansible_ens5.ipv4.address:  10.240.0.31
ansible_default_ipv4:       10.240.0.31
ansible_play_hosts: [
  "worker0.k8s.lan",
  "worker1.k8s.lan",
  "master0.k8s.lan",
  "master1.k8s.lan"
]
ansible_all_ipv4_addresses: [
  "10.240.0.31"
]
ansible_interfaces: [
  "ens5",
  "lo"
]
ansible_local: {
  "network": {
    "fqdn": "worker1.k8s.lan",
    "ip": "10.240.0.31"
  }
}
ansible_virtualization_role: guest
ansible_virtualization_type: kvm
group_names: [
  "cfssl",
  "workers"
],
groups: {
  "all": [
    "worker0.k8s.lan",
    "worker1.k8s.lan",
    "master0.k8s.lan",
    "master1.k8s.lan"
  ],
  "cfssl": [
    "master0.k8s.lan",
    "master1.k8s.lan",
    "worker0.k8s.lan",
    "worker1.k8s.lan"
  ],
  "etcd": [
    "master0.k8s.lan",
    "master1.k8s.lan"
  ],
  "masters": [
    "master0.k8s.lan",
    "master1.k8s.lan"
  ],
  "ungrouped": [],
  "workers": [
    "worker0.k8s.lan",
    "worker1.k8s.lan"
  ]
}
```
