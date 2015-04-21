include_recipe 'apt'
include_recipe 'build-essential'
include_recipe 'mongodb::mongo_gem'

mongodb_user node['crowi']['mongodb']['username'] do
  password   node['crowi']['mongodb']['password']
  database   node['crowi']['mongodb']['database']
  roles      node['crowi']['mongodb']['roles']
  connection node['crowi']['mongodb']['config']
  action :add
end

