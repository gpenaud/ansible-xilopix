ifndef playbook
$(error variable "playbook" should be set)
endif

.ONESHELL:
all: check test

# check-syntax: clean
# 	find . -name '*.py' | xargs -I{} $(PY) -m py_compile {}
#

build:
	@ cd $(playbook)/tests
	@ vagrant destroy -f
	@ vagrant up

deploy:
	@ cd $(playbook)/tests
	@ ansible-playbook -i ./../../../inventories/dynamic/vagrant playbook.yml

test: build deploy

# check-lint:
# 	## calling flake8 directly since it's not done by the setup.py's task
# 	# $(PY) setup.py flake8
# 	$(PY) -m flake8 $(CODEDIR) \
# 		$(shell grep -nR '^#!.\+python' $(CODEDIR) | grep :1: \
# 			| cut -d: -f1)
#
# check-dist:
# 	$(PY) setup.py check
#
#
# test: test-unit
#
# test-unit:
# 	$(PY) -m unittest discover -v
#
# test-coverage:
# 	coverage run --source=$(SRCDIR) -m unittest discover
# 	coverage report --include='$(SRCDIR)/*' -m
#
#
# docs: apidoc $(DOCDIR)/*
# 	$(PY) setup.py build_sphinx
#
# apidoc:
# 	sphinx-apidoc -f -o $(DOCDIR) $(SRCDIR)
#
#
# install:
# 	## using pip since fastText is not compatible with EasyInstall ...
# 	# $(PY) setup.py install
# 	system/install.sh
# 	$(PIP) install --process-dependency-links ".[api]"
#
# install-devel: install
# 	$(PIP) install -r requirements.txt --process-dependency-links
#
# uninstall:
# 	# $(PY) setup.py uninstall
# 	system/uninstall.sh
#
# package:
# 	$(PY) setup.py bdist_egg
#
# dist:
# 	$(PY) setup.py sdist
#
#
# clean:
# 	py3clean .
#
# distclean:
# 	$(PY) setup.py clean --all
#
# .PHONY: all check check-syntax check-lint check-dist test test-unit test-coverage apidoc install install-devel uninstall package dist clean distclean