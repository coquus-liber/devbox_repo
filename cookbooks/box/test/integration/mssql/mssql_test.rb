# # encoding: utf-8
# Inspec test for recipe box::mssql-server

describe service('mssql-server') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

unless os.windows?
  describe user('mssql') do
    it { should exist }
  end
end

describe port(1433) do
  it { should be_listening }
end

# SQLCMDUSER=vagrant SQLCMDPASSWORD=vagrant 
describe bash("sudo -iHu vagrant sqlcmd -Q 'select @@version'") do
  # it { should exist }
  its('stdout') { should match /Microsoft SQL Server/ }
  its('stderr') { should eq '' }
  its('exit_status') { should eq 0 }
end

