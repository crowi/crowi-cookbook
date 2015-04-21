
include_recipe 'nodejs::nodejs_from_package'

nodejs_npm "crowi npm install" do
  name "."
  path "#{node["crowi"]["base_dir"]}/crowi"
end

