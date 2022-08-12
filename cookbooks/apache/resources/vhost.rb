# To learn more about Custom Resources, see https://docs.chef.io/custom_resources/
action :create do
    directory '/srv/apache/admins/html' do
        recursive true
        mode '0755'
    end

    template "#{node['apache']['conf_dir']}/admins.conf" do
        source 'conf.erb'
        mode '0644'
        variables(document_root: '/srv/apache/admins/html', port:8080)
    end

    file '/srv/apache/admins/html/index.html' do
        content '<h1>Welcome admins!</h1>'
    end
end
