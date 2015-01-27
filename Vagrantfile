# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
NODES = ENV["TOWER_DEMO_NODES"].nil? ? 5 : ENV["TOWER_DEMO_NODES"].to_i
START_IP=6
END_IP = NODES - 1 + START_IP




Vagrant.configure(VAGRANTFILE_API_VERSION) do |nodes|
   #nodes.vm.box ="ubuntu/trusty64"
   nodes.vm.box = "chef/centos-6.5"


  (6..END_IP).each_with_index do |last_octet, index|
    index = index + 1
    nodes.vm.define "node-#{index}" do |machine|
      machine.ssh.insert_key = false
      machine.vm.hostname = "node-#{index}"
      machine.vm.network "private_network", ip: "10.42.0.#{last_octet}"
    end
  end
  nodes.vm.define "tower" do |machine|

    machine.vm.provider :virtualbox do |vb, override|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "1"]
    end
    machine.vm.synced_folder "../ansible-tower-db-migrator/", "/ansible-tower-db-migrator"
    machine.vm.synced_folder "../../customers/inova/customer-demo/", "/var/lib/awx/projects/customer-demo"
    machine.vm.hostname = "tower"
    machine.ssh.insert_key = false
    machine.vm.network :private_network, ip: "10.42.0.200"
    machine.vm.provision "ansible" do |ansible|
      ansible.playbook = "provisioning/tower-prep.yml"
      ansible.verbose = "v"
    end
    machine.vm.provision "ansible" do |ansible|
      ansible.playbook = "/tmp/ansible-tower-setup-vagrant/site.yml"
      ansible.inventory_path = "/tmp/ansible-tower-setup-vagrant/myhosts"
      ansible.verbose = "v"
      ansible.limit = 'all'
      ansible.extra_vars = "provisioning/tower_setup_conf.yml"
      ansible.sudo = true
    end
  end
end
