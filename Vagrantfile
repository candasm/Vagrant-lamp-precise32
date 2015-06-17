# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  #box settings
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  #network settings
  config.vm.network "forwarded_port", guest:80, host:8080
  config.vm.network "private_network", ip: "192.168.33.10"
  #provision
  config.vm.provision :shell, :path => "provisions/install.sh"
end
