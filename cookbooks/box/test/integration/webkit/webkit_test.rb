
describe package('libqt5webkit5-dev') do
  it { should be_installed }
end

describe package('xvfb') do
  it { should be_installed }
end

describe command('ruby') do
  it { should exist }
end

describe command('ruby -v') do
  its('stdout') { should match(/^ruby /) }
end

describe gem('capybara-webkit') do
  it { should be_installed }
  its('version') { should eq '1.15.0' }
end

describe command('/opt/test/webkit') do
  it { should exist }
  its('stdout') { should match(/^Hello World!/) }
end

