
# test service
describe service('keepalived') do
  it { should be_installed }
  it { should be_running }
end