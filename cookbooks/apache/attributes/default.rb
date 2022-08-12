case node['platform']
when 'ubuntu'
    default['apache']['package_name'] = 'apache2'
    default['apache']['service_name'] = 'apache2'
    default['apache']['service_resource'] = 'service[apache2]'
    default['apache']['conf_dir'] = '/etc/apache2/sites-enabled'
    default['apache']['site_name'] = '000-default'
else
    default['apache']['package_name'] = 'httpd'
    default['apache']['service_name'] = 'httpd'
    default['apache']['service_resource'] = 'service[httpd]'
    default['apache']['conf_dir'] = '/etc/httpd/conf.d'
    default['apache']['site_name'] = 'welcome'
end

default['apache']['default_index_html'] = '/var/www/html/index.html'