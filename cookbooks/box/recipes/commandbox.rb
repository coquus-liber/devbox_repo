#
# Cookbook:: coldfusion
# Recipe:: commandbox
#

apt_repository 'commandbox' do
  uri        'http://downloads.ortussolutions.com/debs/noarch'
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

bash('box version') do
  user 'vagrant'
  code 'box version'
  live_stream true
end

bash("box install commandbox-cfconfig") do
  user 'vagrant'
  code "box install commandbox-cfconfig"
  live_stream true
end


