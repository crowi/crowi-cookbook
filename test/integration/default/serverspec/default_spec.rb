require 'spec_helper'

describe 'crowi::install' do

  describe user('crowi') do
    it { should exist }
    it { should belong_to_group 'crowi' }
    it { should have_home_directory '/srv/www/crowi' }
    it { should have_login_shell '/bin/sh' }
  end

  describe file('/srv/www') do
    it { should be_directory }
    it { should be_mode 2775 }
    it { should be_owned_by 'www-data' }
    #it { should be_grouped_info 'www-data' }
  end

  describe file('/srv/www/crowi-versions') do
    it { should be_directory }
    it { should be_mode 2775 }
    it { should be_owned_by 'crowi' }
    #it { should be_grouped_info 'crowi' }
  end

  describe file('/srv/www/crowi') do
    it { should be_symlink }
    it { should be_linked_to '/srv/www/crowi-versions/crowi-master' }
  end

  describe file('/etc/init.d/crowi') do
    it { should be_file }
    it { should be_mode 755 }
    it { should be_owned_by 'root' }
    its(:content) { should match /CROWI_USER=crowi/ }
    its(:content) { should match /DAEMON_ARGS="\/srv\/www\/crowi\/app\.js"/ }
  end

  describe port(3000) do
    it { should be_listening }
  end

  describe process('node') do
    it { should be_running }
    its(:user) { should eq 'crowi' }
  end

end

describe server(:app) do
  describe http('http://127.0.0.1/', headers: { 'Host' => $ohai['fqdn'] }) do
    it { expect(response.status).to eq(302) }
  end

  describe http('http://127.0.0.1/login', headers: { 'Host' => $ohai['fqdn'] }) do
    it { expect(response.status).to eq(302) }
  end

  describe http('http://127.0.0.1/installer', headers: { 'Host' => $ohai['fqdn'] }) do
    it { expect(response.status).to eq(200) }
    it { expect(response.body).to include('Crowi</title>') }
  end
end

