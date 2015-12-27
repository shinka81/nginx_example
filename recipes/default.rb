# Add nginx public repo.
yum_repository 'nginx' do
  description 'nginx public repo'
  baseurl 'http://nginx.org/packages/centos/$releasever/$basearch/'
  gpgkey 'http://nginx.org/keys/nginx_signing.key'
  gpgcheck true
  action [:create, :makecache]
end

# Create user/group.
user 'nginx'
group 'nginx'

# Install nginx.
package 'nginx'

# Land html pages.
node['nginx_example']['remote_files']['www'].each do |file, value|
  %w(uri file_name path).each do |key|
    fail "#{node['nginx_example']['remote_files']['www'][file]} must contain a uri, file_name, and path" unless value.key?(key)
  end
  remote_file "/usr/share/nginx/html/#{value['file_name']}" do
    source value['uri']
    owner 'root'
    group 'root'
  end
end

# Render nginx server config. Notify nginx to reload if new page landed.
template '/etc/nginx/conf.d/default.conf' do
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode '0744'
  notifies :reload, 'service[nginx]', :delayed
end

# Start/enable service.
service 'nginx' do
  supports reload: true
  action [:enable, :start]
end
