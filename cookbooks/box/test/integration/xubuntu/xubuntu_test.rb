# # encoding: utf-8

# Inspec test for recipe box::xubuntu

packages = %w(
  xubuntu-core
  firefox
  vim-gnome
  terminator
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

