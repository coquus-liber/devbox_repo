
arca = default[:arca]

arca[:user] = 'vagrant'

arca[:packages] 
arca[:packages] = %w(
  wget
  curl
  git
  git-all
  git-lfs
  linux-virtual
  openssh-server
  build-essential
  ruby
  nodejs
  npm
  openjdk-8-jdk
  python3
  vim
  nano
)

# values for ubuntu

default['ubuntu']['archive_url']  = 'http://us.archive.ubuntu.com/ubuntu'
default['ubuntu']['security_url'] = 'http://us.archive.ubuntu.com/ubuntu'
default['ubuntu']['include_source_packages'] = false
default['ubuntu']['components'] = 'main restricted universe multiverse'
default['ubuntu']['codename'] = (node['lsb'] || {})['codename']

# If you want to limit the repositories to a specifc arch set this to an array of archs
default['ubuntu']['architectures'] = ['amd64']

default['ubuntu']['locale'] = nil
