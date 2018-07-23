
user 'vagrant' do
  password 'vagrant'
end

group 'vagrant' do
  members 'vagrant'
end

group 'nopasswdlogin' do
  system true
  members 'vagrant'
end

directory "/home/vagrant" do
  user 'vagrant'
  group 'vagrant'
  mode '0700'
end

directory "/home/vagrant/.ssh" do
  user 'vagrant'
  group 'vagrant'
  mode '0700'
end


