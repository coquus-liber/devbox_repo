
# values for ubuntu
default['ubuntu'] = {
  archive_url: 'http://us.archive.ubuntu.com/ubuntu',
  security_url: 'http://us.archive.ubuntu.com/ubuntu',
  include_source_packages: false,
  components: 'main restricted universe multiverse',
  codename: (node['lsb'] || {})['codename'],
  architectures: ['amd64'],
  locale: 'en_US.UTF-8'
}

box = default[:box]

box[:ppas] = {
  'git-core': 'ppa:git-core/ppa'
}

# package list
box[:packages] = %w(
  linux-virtual
  openssh-server
  build-essential
  ruby-full
  ruby-dev
  nodejs
  npm
  wget
  curl
  git
  openjdk-8-jdk
  python3
  nano
  xubuntu-core
  firefox
  chromium-browser
  chromium-chromedriver
  vim-gnome
  terminator
  qt5-default
  libqt5webkit5-dev
  gstreamer1.0-plugins-base
  gstreamer1.0-tools
  gstreamer1.0-x
  xvfb
  libpq-dev
  ruby-pg
  redis-server
  redis-sentinel
  redis-tools
  ruby-redis
  sqlite3
  libsqlite3-dev
  ruby-sqlite3
)

box[:gems] = %w(
  rspec-rails
  capybara-webkit
  headless
  rack-app
  puma
  pg
  sqlite3
  mailcatcher
)

box[:npm] = %w(
  yarn
  n
  pg
)


