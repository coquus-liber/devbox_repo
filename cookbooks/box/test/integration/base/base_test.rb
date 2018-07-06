# # encoding: utf-8

# Inspec test for recipe box::base

packages = %w(
  linux-virtual
  openssh-server
  build-essential
  ruby
  nodejs
  npm
  wget
  curl
)

packages.each do |name|
  describe package(name) do
    it { should be_installed }
  end
end

describe service('ssh') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port(22) do
  it { should be_listening }
end

