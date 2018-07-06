#
# Cookbook:: box
# Recipe:: gui
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package node[:box][:gui][:packages]
group 'nopasswdlogin' do
  system true
  members 'vagrant'
end

