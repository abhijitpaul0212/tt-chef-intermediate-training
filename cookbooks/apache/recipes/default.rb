#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved


package node['apache']['package_name']

file node['apache']['default_index_html'] do
  content '<h1>Welcome Home!</h1>'
end

apache_vhost node['apache']['site_name'] do
  site_name node['apache']['site_name']
  action :remove
  notifies :restart, node['apache']['service_resource']
end

# apache_vhost 'admins' do
#   site_name 'admins'
#   site_port 8080
#   action :create
# end

# apache_vhost 'users' do
#   site_name 'users'
#   site_port 80
#   action :create
# end

apache_vhost 'admins' do
  site_port 8080
  notifies :restart, node['apache']['service_resource']
end

apache_vhost 'users' do
  notifies :restart, node['apache']['service_resource']
end

service node['apache']['service_name'] do
  action [:enable, :start]
end
