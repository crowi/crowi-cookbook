
directory node["crowi"]["base_dir"] do
  owner node["crowi"]["owner"]
  group node["crowi"]["group"]
  mode 02775
  recursive true
end

directory "#{node["crowi"]["base_dir"]}/crowi-versions/" do
  owner node["crowi"]["owner"]
  group node["crowi"]["group"]
  mode 02775
end

v = node["crowi"]["version"]

if v == "master"
  source_url = "https://github.com/crowi/crowi/tarball/master"
else
  # TODO fix v prefix
  source_url = "https://github.com/crowi/crowi/archive/v#{v}.tar.gz"
end

ark "crowi-#{v}" do
  name "crowi"
  url source_url
  extension "tar.gz"
  prefix_home node["crowi"]["base_dir"]
  prefix_root "#{node["crowi"]["base_dir"]}/crowi-versions"
  owner node["crowi"]["owner"]
  group node["crowi"]["group"]
  version v
  mode 02775
  action :install
  notifies :restart, "service[crowi]"
end

template "/etc/init.d/crowi" do
  source "etc/init.d/crowi.erb"
  mode 00755
  variables({
    :base_dir       => node["crowi"]["base_dir"],
    :mongo_user     => node["crowi"]["mongodb"]["username"],
    :mongo_password => node["crowi"]["mongodb"]["password"],
    :mongo_host     => node["crowi"]["mongodb"]["config"]["host"],
    :mongo_port     => node["crowi"]["mongodb"]["config"]["port"],
    :mongo_db       => node["crowi"]["mongodb"]["database"],
    :redis_host     => node["crowi"]["redis"]["host"],
    :redis_port     => node["crowi"]["redis"]["port"],
    :env            => node["crowi"]["env"],
    :port           => node["crowi"]["port"],
    :seed           => node["crowi"]["seed"],
    :token          => node["crowi"]["token"],
    :user           => node["crowi"]["owner"]
  })
  notifies :restart, "service[crowi]"
end

service "crowi" do
  supports :start => true, :stop => true, :restart => true
  action [ :enable ]
end

