#! /bin/bash -e

tower_version=$(python -c "import yaml; data=yaml.load(open('provisioning/host_vars/tower').read()); print data['tower_version']")
tower_config=$1
setup_dir=/tmp/ansible-tower-setup-vagrant

git submodule foreach git pull

# tower playbooks need to be fetched prior to vagrant up or vagrant
# provisioner will complain that they don't exist
wget -P /tmp/ -N  http://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-${tower_version}.tar.gz 

rm -rf ${setup_dir}
mkdir ${setup_dir}
tar xvf /tmp/ansible-tower-setup-${tower_version}.tar.gz -C ${setup_dir} --strip-components=1
cat << EOF > ${setup_dir}/myhosts
[all]
10.42.0.200
EOF

vagrant up tower

#tower_populator/tower_populator ${tower_config}
