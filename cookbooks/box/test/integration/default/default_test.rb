# # encoding: utf-8
# found at http://inspec.io/docs/reference/resources/

unless os.windows?
  describe user('root'), :skip do
    it { should exist }
  end
end

describe port(80), :skip do
  it { should_not be_listening }
end

