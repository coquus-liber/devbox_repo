#
# Cookbook:: commandbox
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_repository 'commandbox' do
  uri 'http://downloads.ortussolutions.com/debs/noarch'
  distribution '/'
  # keyserver 'keys.gnupg.net'
  # key '6DA70622'
  key 'commandbox.gpg'
end

yum_repository 'commandbox' do
  baseurl "http://downloads.ortussolutions.com/RPMS/noarch"
  failovermethod priority
  enabled true
  metadata_expire '7d'
  gpgcheck false
  action :create
end

include_recipe 'java::default'

package('commandbox')

if platform_family?('rhel')
  file '/usr/bin/box' do
    mode '755'
  end
end

directory '/home/vagrant/.CommandBox' do
  user 'vagrant'
  group 'vagrant'
  mode '755'
end

git '/home/vagrant/.CommandBox/artifacts' do
  repository 'https://github.com/coquus-liber/commandbox_artifacts.git'
  user 'vagrant'
  group 'vagrant'
end

execute('box version') do
  user 'vagrant'
  group 'vagrant'
  command 'box version'
  live_stream true
end

execute("box install commandbox-cfconfig") do
  user 'vagrant'
  group 'vagrant'
  command "box install commandbox-cfconfig"
  live_stream true
end

