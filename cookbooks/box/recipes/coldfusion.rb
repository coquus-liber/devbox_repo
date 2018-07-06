
cf = node[:coldfusion]

dir = cf[:dir]
directory dir

install_dir = cf[:install_dir]
directory install_dir

folder = cf[:folder]
directory folder

cf_user = cf[:user]
user cf_user do
  system true
end

installer = cf[:installer]
installer_path = install_dir + '/' + installer 
remote_file installer_path do
  source cf[:url]
  owner 'root'
  group 'root'
  mode '0755'
  show_progress true
end

template install_dir + '/silent.properties' do
  source 'silent.properties.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables cf.to_hash
end

execute "install coldfusion" do
  cwd install_dir
  command "./#{installer} -f silent.properties"
  live_stream true
end

