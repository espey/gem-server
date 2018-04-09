remote_file '/tmp/chefdk-2.5.3-1.el7.x86_64.rpm' do
  source 'file:///tmp/chefdk-2.5.3-1.el7.x86_64.rpm'
end

bash 'rpm -Uvh /tmp/chefdk-2.5.3-1.el7.x86_64.rpm' do
  code <<-EOH
    rpm -Uvh /tmp/chefdk-2.5.3-1.el7.x86_64.rpm
  EOH
end

directory '/gems' do
end

bash 'install gems' do
  code <<-EOH
    /opt/chef/embedded/bin/gem install /tmp/bundler-1.16.1.gem -i /gems/.
  EOH
end

bash 'start gem server' do
  code <<-EOH
    /opt/chef/embedded/bin/gem server --dir /gems/.
  EOH
end
