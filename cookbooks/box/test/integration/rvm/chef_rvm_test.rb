
describe command('sudo -iHu vagrant rvm current') do
  its('stdout') { should match /ruby-2.4.4/ }
  its('stderr') { should eq '' }
  its('exit_status') { should eq 0 }
end

describe command('sudo -iHu vagrant rvm list') do
  its('stdout') { should match /ruby-2.4.4/ }
  its('stdout') { should match /ruby-2.5.1/ }
  its('stderr') { should eq '' }
  its('exit_status') { should eq 0 }
end

