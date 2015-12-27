require 'spec_helper'

describe 'nginx_example' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: '6.5').converge(described_recipe) }

  it 'Installs nginx' do
    expect(chef_run).to install_package('nginx')
  end

  it 'Create user nginx' do
    expect(chef_run).to create_user('nginx')
  end

  it 'Create group nginx' do
    expect(chef_run).to create_group('nginx')
  end

  it 'Creates nginx yum repo' do
    expect(chef_run).to create_yum_repository('nginx')
  end

  it 'Downloads example html' do
    expect(chef_run).to create_remote_file('/usr/share/nginx/html/example.html')
  end

  it 'Errors when passed an invalid uri to pull' do
    chef_run.node.set['nginx_example']['remote_files']['www']['test1']['test2'] = 'hello'
    expect { chef_run.converge(described_recipe) }.to raise_error(RuntimeError)
  end

  it 'Renders nginx config and notifies service[nginx] to reload if new content.' do
    expect(chef_run).to render_file('/etc/nginx/conf.d/default.conf')
      .with_content(/index example.html/)
    expect(chef_run.template('/etc/nginx/conf.d/default.conf')).to notify('service[nginx]').to(:reload).delayed
  end

  it 'Enables and starts nginx service' do
    expect(chef_run).to start_service('nginx')
    expect(chef_run).to enable_service('nginx')
  end
end
