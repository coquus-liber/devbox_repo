#
# Cookbook:: box
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

directory "/home/vagrant/.ssh" do
  user 'vagrant'
  group 'vagrant'
  mode '0700'
end

include_recipe 'ubuntu::default' # includes 'apt::default'
include_recipe 'box::upgrade'
include_recipe 'box::base'
include_recipe 'box::script_repos'
include_recipe 'box::git_prompt'
include_recipe 'box::rvm'
include_recipe 'box::postgresql'
include_recipe 'box::webkit'
include_recipe 'java::default'
include_recipe 'box::commandbox'
include_recipe 'box::mssql'
include_recipe 'box::freetds'
# include_recipe 'box::coldfusion'
include_recipe 'box::gui'
include_recipe 'box::mailcatcher'
# include_recipe 'box::reboot_after'

