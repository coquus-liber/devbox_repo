# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative 'lib/proxy.rb'
require_relative 'lib/chef_paths.rb'
require_relative 'lib/virtualbox.rb'

Vagrant.configure("2") do |config|

  config.vm.box = "bento/ubuntu-16.04"

  chef_mode = "chef_client"

  config.vm.provision chef_mode, run: :always do |chef|
    chef.product = 'chefdk'
    set_chef_proxy(chef)

    case chef_mode
    when 'chef_client'
      chef.chef_server_url = "https://api.chef.io/organizations/userhackable"
      chef.validation_key_path = "~/.chef/userhackable-validator.pem"
      chef.validation_client_name = 'userhackable-validator'
    when 'chef_zero'
      set_paths(chef)
    end

    chef.add_recipe "box"
  end
end
