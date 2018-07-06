
postgresql_server_install 'install Local development Postgresql Server' do
  version '9.6'
  password 'vagrant'
  action [:install, :create]
end

# create a postgresql user 'vagrant'
postgresql_user 'vagrant' do
  user 'vagrant'
  superuser true
  password 'vagrant'
end

# create default database for the 'vagrant' user
postgresql_database 'vagrant' do
  owner 'vagrant'
  not_if "psql vagrant -c \"\"", user: 'vagrant'
end

package 'libpq-dev'

