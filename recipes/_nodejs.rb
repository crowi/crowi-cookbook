
include_recipe 'nodejs::nodejs_from_package'

package "git"

nodejs_npm "crowi npm install" do
  name "."
  user node["crowi"]["owner"]
  group node["crowi"]["group"]
  path "#{node["crowi"]["base_dir"]}/crowi"
end

