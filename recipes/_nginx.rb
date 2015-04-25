package 'nginx'

template "/etc/nginx/sites-available/crowi" do
  source "etc/nginx/sites-available/crowi.erb"
  mode 00644
  variables({
    :base_dir => "#{node["crowi"]["base_dir"]}/crowi",
    :server_name => node["crowi"]["fqdn"],
    :node_url => "localhost",
    :node_port => node["crowi"]["port"]
  })
  notifies :restart, "service[nginx]"
end

link "/etc/nginx/sites-enabled/crowi" do
  to "/etc/nginx/sites-available/crowi"
  notifies :restart, "service[nginx]"
end

service "nginx" do
  supports :restart => true
  action [ :enable ]
end
