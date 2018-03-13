# the dynamic inventory path
INVENTORY=${ANSIBLE_PERSONAL_PATH}/inventories/dynamic/vagrant
# the current playbook test directory
PLAYBOOK_TEST_PATH=${ANSIBLE_PERSONAL_PATH}/playbooks/$(playbook)/tests
# test teh server specifications
GOSS_CMD=goss -g /etc/server-validation.yml validate
SSH=ssh -x -t -o "StrictHostKeyChecking=no"
CONTAINER_IP=$(shell $(INVENTORY)/vagrant.rb -g -d $(PLAYBOOK_TEST_PATH))

ifndef playbook
$(error variable "playbook" should be set)
endif

.ONESHELL:

build:
	@ cd $(PLAYBOOK_TEST_PATH)
	@ vagrant destroy -f
	@ vagrant up

deploy:
	@ cd $(PLAYBOOK_TEST_PATH)
	@ ansible-playbook -i $(INVENTORY) test.yml

validate:
	@ cd $(PLAYBOOK_TEST_PATH)
	@ ansible-playbook -i $(INVENTORY) test.yml --tags validate
	@ $(SSH) $(CONTAINER_IP) $(GOSS_CMD)

clean:
	@ cd $(PLAYBOOK_TEST_PATH)
	@ vagrant destroy -f

test: build validate clean