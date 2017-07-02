# # encoding: utf-8

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

require('pry')

describe user('postgres') do
  it { should exist }
end

describe port(5050) do
  it { should be_listening }
end

describe port(5432) do
  it { should be_listening }
end

describe service('postgresql') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

#TODO: figure out how to get the target-hostname in a clean way
targetIp = @backend.backend.hostname
puts @backend.backend.hostname

describe http("http://#{targetIp}:5050/browser/server/nodes/1/") do
  its('status') { should cmp 200 }
end
