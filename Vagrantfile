# -*- mode: ruby -*-
# vi: set ft=ruby :

plugins=%w( vagrant-proxyconf vagrant-vbguest )
plugins.each do |plugin|
  unless Vagrant.has_plugin?(plugin)
    system 'vagrant', 'plugin', 'install', plugin
  end
end

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = ENV['http_proxy']
    config.proxy.https    = ENV['https_proxy']
    config.proxy.ftp      = ENV['ftp_proxy']
    config.proxy.no_proxy = ENV['no_proxy']
  end

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    # vb.name = "xenial"
    vb.memory = 1024 * 4
    vb.cpus = 2
    # v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]

    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
    vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ['modifyvm', :id, '--cableconnected1', 'on']

    # Add a virtual cd drive (for guest additions, etc)
    vb.customize ['storageattach', :id,
      "--storagectl", "IDE Controller",
      '--port', 1,
      '--device', 0,
      '--type', 'dvddrive',
      '--medium', 'emptydrive'] # 'additions' ?
  end

  chef_mode = ENV['chef_mode'] || 'chef_zero'
  config.vm.provision chef_mode, run: :always do |chef|
    chef.product = 'chefdk'

    chef.http_proxy = ENV['http_proxy']
    chef.https_proxy = ENV['https_proxy']
    chef.no_proxy = ENV['no_proxy']

    case chef_mode
    when 'chef_client'
      chef.chef_server_url = ENV['chef_server_url']
      chef.validation_key_path = ENV['chef_validation_key_path']
      chef.validation_client_name = ENV['chef_validation_client_name']
    when 'chef_zero'
      chef.cookbooks_path = "cookbooks"
      chef.data_bags_path = "data_bags"
      chef.nodes_path = "nodes"
      chef.roles_path = "roles"
    end

    chef.add_recipe "box"
  end

end
