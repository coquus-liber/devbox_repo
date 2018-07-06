
execute "apt-upgrade" do
  environment(DEBIAN_FRONTEND: 'noninteractive', ACCEPT_EULA: 'Y')
  command 'apt-get -fuy -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" --with-new-pkgs upgrade'
  live_stream true
end

