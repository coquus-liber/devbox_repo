#
# Cookbook:: arca
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

arca = node[:arca]

user arca[:user]

directory "/home/#{ arca[:user] }/.ssh" do
  user arca[:user]
  group arca[:user]
  mode '0700'
end

include_recipe 'ubuntu::default' # includes 'apt::default'

apt_repository 'git-core' do
  uri         'ppa:git-core/ppa'
end

packagecloud_repo "github/git-lfs" do
  type "deb" # or "rpm" or "gem"
end

execute "apt-upgrade" do
  environment(DEBIAN_FRONTEND: 'noninteractive', ACCEPT_EULA: 'Y')
  command 'apt-get -fuy -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" --with-new-pkgs upgrade'
  live_stream true
end

package arca[:packages]

