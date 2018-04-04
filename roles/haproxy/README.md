Keepalived
==========

Example Playbook
----------------
- hosts: all
  roles:
     - { role: ../../keepalived }

License
-------
BSD

Author Information
------------------
Guillaume Penaud - <guillaume.penaud@xilopix.com>
Lead-devops engineer @ Xilopix

Development
-----------
cd gateway/tests
sudo molecule test --from-scratch --all

Tests
-----
sudo molecule verify
