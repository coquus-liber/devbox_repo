
package %w(
  ruby-full
  qt5-default
  libqt5webkit5-dev
  gstreamer1.0-plugins-base
  gstreamer1.0-tools
  gstreamer1.0-x
  xvfb
)

gem_package "capybara-webkit"
gem_package "headless"
gem_package "rack-app"
gem_package "puma"

directory "/opt/test"

cookbook_file "/opt/test/webkit" do 
  source 'webkit/test'
  mode '0755'
end

