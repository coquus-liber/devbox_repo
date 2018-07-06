
box = default[:box]
base = box[:base]

base[:packages] = %w(
  linux-virtual
  openssh-server
  build-essential
  ruby
  nodejs
  npm
  wget
  curl
  git
  openjdk-8-jdk
  python3
  vim
  nano
)

base[:gems] = %w(
  rspec
)


