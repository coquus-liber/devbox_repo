# # encoding: utf-8

# Inspec test for recipe coldfusion::commandbox

describe command('box') do
  it { should exist }
end

