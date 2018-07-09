
user 'vagrant' do
  comment 'vagrant user'
  uid '1000'
  gid '1000'
  home '/home/vagrant'
  manage_home true
  shell '/bin/bash'
  password "$6$DAHID3RR$IYSeaST.rtbpq/BbdwdrJiu3mWSDkSR/UZLdDfY6RboJYHHaLxFidI8LarOqt7Zaq9ThFpkI1sNsTvJm0F.uX0" #:17691:0:99999:7:::

end

group 'vagrant' do
  members 'vagrant'
end

directory "/home/vagrant/.ssh" do
  user 'vagrant'
  group 'vagrant'
  mode '0700'
end


