#! /bin/bash -x

# run setup if it's not already installed
if [ ! -d /etc/awx ]; then
	cd /tmp/ansible-tower-setup-*/
	./setup.sh
fi