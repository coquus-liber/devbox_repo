# # encoding: utf-8

# Inspec test for recipe box::postgresql

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

# package %w(
#   postgresql 
#   postgresql-client 
#   postgresql-contrib 
#   pgadmin3
#   libpq5 
#   ruby-pg
# )

describe service('postgresql') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

unless os.windows?
  describe user('vagrant') do
    it { should exist }
  end
end

describe port(5432) do
  it { should be_listening }
end

describe bash("sudo -iHu vagrant psql -t -c \"select usename from pg_user where usename = 'vagrant'\"") do
  # it { should exist }
  its('stdout') { should match /vagrant/ }
  its('stderr') { should eq '' }
  its('exit_status') { should eq 0 }
end

postgres_access = postgres_session('vagrant', 'vagrant', '127.0.0.1')
describe postgres_access.query('SELECT 1;', ['vagrant']) do
  its('output') { should eq '1' }
end
