
user 'vagrant' do
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

file "/etc/sudoers.d/99_vagrant" do
  content "vagrant ALL=(ALL) NOPASSWD:ALL"
  mode '0440'
end

directory "/etc/lightdm/lightdm.conf.d" do
  recursive true
end

file "/etc/lightdm/lightdm.conf.d/50-myconfig.conf" do
  content <<~CONF
    [SeatDefaults]
    autologin-user=vagrant
    AUTOLOGIN
  CONF
end

directory "/home/vagrant/.config/terminator" do
  recursive true
  user 'vagrant'
  group 'vagrant'
  mode '0700'
end

cookbook_file "/home/vagrant/.config/terminator/config" do
  source 'terminator_config'
  user 'vagrant'
  group 'vagrant'
  mode '0700'
end

directory "/home/vagrant/.config/xfce4/terminal" do
  recursive true
  user 'vagrant'
  group 'vagrant'
  mode '0700'
end

cookbook_file "/home/vagrant/.config/xfce4/terminal/terminalrc" do
  source 'xfce_terminalrc'
  user 'vagrant'
  group 'vagrant'
  mode '0700'
end

directory "/home/vagrant/.config/xfce4/panel" do
  recursive true
  user 'vagrant'
  group 'vagrant'
  mode '0700'
end

cookbook_file "/home/vagrant/.config/xfce4/panel/whiskermenu-1.rc" do
  source 'whiskermenu.rc'
  user 'vagrant'
  group 'vagrant'
  mode '0700'
end

