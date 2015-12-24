require 'serverspec'

set :backend, :exec

describe yumrepo('nginx') do
  it { should be_enabled }
end

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
end

describe service('nginx') do
  it { should be_running }
end

describe port(8000) do
  it { should be_listening }
end

describe user('nginx') do
  it { should belong_to_group 'nginx' }
end

describe file('/etc/nginx/conf.d/default.conf') do
  it { should be_file }
  its(:content) { should match(/index example.html/) }
end

describe command('curl localhost:8000') do
  its(:stdout) { should match(/Basic webpage for PSE Exercise/) }
end
