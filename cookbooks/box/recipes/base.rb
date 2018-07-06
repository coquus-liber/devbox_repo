#
# Cookbook:: box
# Recipe:: base
#
# Copyright:: 2018, The Authors, All Rights Reserved.

base = node[:box][:base]
package base[:packages]

base[:gems].each do |gem|
  gem_package gem
end

