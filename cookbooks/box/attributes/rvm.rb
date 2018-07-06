
default[:rvm][:git][:repo] = 'https://github.com/rvm/rvm.git'
default[:rvm][:git][:version] = 'stable'
default[:rvm][:rubies] = %w(ruby-2.4.4 ruby-2.5.1)
default[:rvm][:use] = "ruby-2.4.4"
default[:rvm][:user][:vagrant] = {
  group: :vagrant
}

