# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "centos/7"
  config.vm.hostname = "docker-host"
  config.vm.provision "shell",
    inline: "sudo yum -y install docker && sudo systemctl start docker"
  config.vm.network "forwarded_port", guest: 80, host: 4567
  #config.vm.network "forwarded_port", guest: 55555, host: 55555

  # requires a vagrant plugin vagrant-gatling-rsync
  # to install :-
  # $vagrant plugin install vagrant-gatling-rsync
  #config.vm.synced_folder '../drupal/profiles/myprofile', '/srv/myprofile', type: 'rsync'

  # the centos/7 box uses rsync by default, for windows you'll want to disable it if you didn't install the plugin ^^
  if Vagrant::Util::Platform.windows? then
    config.vm.synced_folder ".", "/vagrant", disabled: true
  end

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  # config.ssh.forward_agent = true

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file default.pp in the manifests_path directory.
  #
  # config.vm.provision "puppet" do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "site.pp"
  # end

end