
include_recipe 'nodejs'

box = node[:box]
box[:npm].each do |npm_pkg|
  npm_package npm_pkg
end

