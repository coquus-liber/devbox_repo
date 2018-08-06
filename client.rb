# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

file = File.expand_path(__FILE__)
dir = File.dirname(file)
chef_repo_path dir
local_mode true
log_level                :info
log_location             STDOUT
cookbook_path            [File.join(dir,'cookbooks')]

