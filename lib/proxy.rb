
module Proxy
  def http_proxy
    @http_proxy ||= ENV['http_proxy']
  end
  def https_proxy
    @https_proxy ||= ENV['https_proxy']
  end
  def ftp_proxy
    @ftp_proxy ||= ENV['ftp_proxy']
  end
  def no_proxy
    @no_proxy ||= ENV['no_proxy']
  end
  def set_proxy proxy
    # vagrant plugin install vagrant-proxyconf
    proxy.http     = http_proxy
    proxy.https    = https_proxy
    proxy.ftp      = ftp_proxy
    proxy.no_proxy = no_proxy
  end
  def set_chef_proxy chef
    chef.http_proxy = ENV['http_proxy']
    chef.https_proxy = ENV['https_proxy']
    # chef.ftp_proxy = ENV['ftp_proxy']
    chef.no_proxy = ENV['no_proxy']
  #  chef.json = { proxy: proxy.to_h }
  end
end

Vagrant.configure("2") do |config|
  include Proxy
  if Vagrant.has_plugin?("vagrant-proxyconf")
    set_proxy(config.proxy)
  end
end


