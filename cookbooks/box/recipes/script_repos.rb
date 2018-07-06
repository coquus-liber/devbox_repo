
directory "/opt/box" do
  user 'vagrant'
  group 'vagrant'
end

git '/opt/box/setup' do
  repository "https://github.com/capnregex/setup.git"
  user 'vagrant'
  group 'vagrant'
end

git '/opt/box/install' do
  repository "https://github.com/capnregex/install_scripts.git"
  user 'vagrant'
  group 'vagrant'
end


