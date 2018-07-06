module ChefPaths
  def set_paths chef
    chef.cookbooks_path = "../../cookbooks"
    chef.data_bags_path = "../../data_bags"
    chef.nodes_path = "../../nodes"
    chef.roles_path = "../../roles"
  end
end

Vagrant.configure("2") do |config|
  include ChefPaths
end
