# -*- mode: ruby -*-
# vi: set ft=ruby :


# Install required plugins
required_plugins = ["vagrant-hostsupdater"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

 
# "2" configures version
Vagrant.configure("2") do |config|
  # Control
  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/bionic64"
    app.vm.network "private_network", ip: "192.168.10.100"
    app.hostsupdater.aliases = ["development.app"]
    
    # Sync folder
    app.vm.synced_folder "app", "/home/ubuntu/app"
    # Linking provision script
    # config.vm.provision "shell", path: "provision.sh"
    # Installing ansible 
    app.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbook.yml"
    end

  # Agents
  config.vm.define "web" do |web|
    # Specify box
    web.vm.box = "ubuntu/bionic64"
    # Assign IP
    web.vm.network :private_network, ip: "192.168.10.10"
    # Assign hostname for VM and browser access
    web.vm.hostname = "web"
    config.hostsupdater.aliases = ["development.local"]
  end

  config.vm.define "db" do |db|
    # Specify box
    db.vm.box = "ubuntu/bionic64"
    # Assign IP
    db.vm.network :private_network, ip: "192.168.10.20"
    # Assign hostname for VM and browser access
    db.vm.hostname = "db"
    config.hostsupdater.aliases = ["development.db"]
  end

  # config.vm.define "aws" do |aws|
    # Specify box
    # aws.vm.box = "ubuntu/bionic64"
    # Assign IP
    # aws.vm.network :private_network, ip: "192.168.10.30"
    # Assign hostname for VM and browser access
    # aws.vm.hostname = "aws"
    # config.hostsupdater.aliases = ["development.aws"]
  # end

end