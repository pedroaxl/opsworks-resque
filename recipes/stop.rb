service 'resque' do
  action [:stop]
  provider Chef::Provider::Service::Upstart
end
