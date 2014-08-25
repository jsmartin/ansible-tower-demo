Ansible Tower Demo-In-A-Box
===========================

This is a Tower demo environment in a box using Vagrant and VirtualBox.

Host Machine Requirements:

- Ansible (version 1.6 or later)
- Vagrant (version 1.5.1 or later)
- VirtualBox (version 4.3 or later)
- Git 
- An Internet connection to create the demo environment.
- The ability to run 5 VM's on your system. 

Ansible install instructions here: http://docs.ansible.com/intro_installation.html

To install Vagrant and VirtualBox, please see http://docs.vagrantup.com/ and https://www.virtualbox.org/wiki/Downloads

**Note:** The demo requires an internet connection on your host machine.

Tested to work with Tower 1.4.10 and above.



Preparing The Demo
------------------

#### Prerequisites ####

You'll need Ansible installed and working.  You'll also need tower-cli:

	pip install ansible-tower-cli

This demo uses the [tower_populator project ](https://github.com/jsmartin/tower_populator)to populator tower with various items.  Please have a look at that project, and create a template that suits your needs.  The project is included as a submodule for your convenience. 

This is to be considered a stop-gap until a Tower module for Ansible is available.  At that time, it's like that new configuration template's will need to be created.

#### Instantiation ####

Execute the command below to create and configure the VMs for the demo.

	run_me.sh /path/to/my/tower_populator_template.yml


Running the Demo
----------------

Now you can log into tower at https://10.42.0.200 or the IP you have specified.  Further information about tower can be found here: http://www.ansible.com/tower  (User guide can be downloaded from that webpage.)

The admin user to log in as is:

User: admin
Password: password

Further material to get you started in ansible Tower can be found in this PDF: http://releases.ansible.com/ansible-tower/docs/tower_user_guide-latest.pdf 



## Thanks

Thanks to the following github users:

* [dfederlein](https://github.com/dfederlein/) -- for starting the original vagrant-tower project
* [hectcastro](https://github.com/hectcastro/) -- for whom I borrowed  Vagrant file ideas.


