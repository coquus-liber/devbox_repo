#
# Cookbook:: box
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

include_recipe 'box::vagrant_user'

include_recipe 'ubuntu::default' # includes 'apt::default'
include_recipe 'box::packages'
include_recipe 'box::upgrade'
include_recipe 'box::postgresql'
include_recipe 'box::git'
include_recipe 'box::gems'
include_recipe "box::nodejs"
include_recipe 'box::script_repos'

# include_recipe 'rvm'

#include_recipe 'box::webkit'
#include_recipe 'java::default'
#include_recipe 'box::commandbox'
#include_recipe 'box::mssql'
#include_recipe 'box::freetds'
#include_recipe 'box::coldfusion'
#include_recipe 'box::mailcatcher'
# include_recipe 'box::reboot_after'


