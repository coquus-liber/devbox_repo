
package %w(wget build-essential libc6-dev)

directory '/opt/freetds/'

remote_file '/opt/freetds/freetds.tgz' do
  source 'http://www.freetds.org/files/stable/freetds-patched.tar.gz'
end

bash 'install freetds' do
  cwd '/opt/freetds/'
  code <<~BASH
    tar --strip-components=1 -xzf freetds.tgz 
    ./configure --prefix=/usr/local --with-tdsver=7.3
    make
    make install
  BASH
  creates '/usr/local/bin/tsql'
end

gem_package 'tiny_tds'
gem_package 'activerecord-sqlserver-adapter'

