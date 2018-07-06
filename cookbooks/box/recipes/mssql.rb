#!/usr/bin/env ruby
# Cookbook:: box
# Recipe:: mssql

package 'debconf-utils'

mssql = node[:mssql]
password = mssql[:password]

apt = mssql[:apt]
apt[:repos].each do |name, path|
  host = apt[:host]
  apt_repository 'mssql-' + name do
    key host + apt[:key]
    uri host + path
    arch apt[:arch]
    distribution apt[:distribution]
    components apt[:components]
  end
end

package mssql[:packages] do
  response_file 'mssql.seed'
end

execute "install broken packages" do
  # these packages require that the ACCEPT_EULA environment variable be set. 
  pkgs = mssql[:broken_packages].join(' ')
  environment(
    DEBIAN_FRONTEND: 'noninteractive',
    ACCEPT_EULA: 'Y'
  )
  command "apt-get install -y #{pkgs}"
end

cookbook_file("/var/opt/mssql/mssql.conf") do
  source 'mssql.conf'
  owner 'mssql'
  group 'mssql'
  mode '0644'
end

service 'mssql-server' do
  ignore_failure true
  action :stop
end

# Run mssql-conf setup...
execute 'mssql-conf' do
  command "/opt/mssql/bin/mssql-conf -n setup"
  environment(
    MSSQL_SA_PASSWORD: password,
    MSSQL_PID: mssql[:pid],
  )
end

service 'mssql-server' do
  action :enable
end

service 'mssql-server' do
  action :restart
end

link '/usr/bin/sqlcmd' do
  to '/opt/mssql-tools/bin/sqlcmd'
end

link '/usr/bin/bcp' do
  to '/opt/mssql-tools/bin/bcp'
end

template '/etc/profile.d/mssql_profile.sh' do
  source 'mssql_profile.sh.erb'
  variables password: password
end

script "create db vagrant user" do
  environment(
    SQLCMDSERVER: 'localhost',
    SQLCMDUSER: 'SA',
    SQLCMDPASSWORD: password,
  )
  interpreter "sqlcmd"
  flags '-l 120 -i'
  code <<~SQL
    CREATE DATABASE [vagrant];
    CREATE LOGIN [vagrant] WITH PASSWORD=N'#{password}', DEFAULT_DATABASE=[vagrant], CHECK_POLICY=OFF;
    ALTER SERVER ROLE [sysadmin] ADD MEMBER [vagrant];
    GO
  SQL
  live_stream true
end

