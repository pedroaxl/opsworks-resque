#
# Cookbook Name:: opsworks-resque-scheduler
# Recipe:: default
#
# Copyright (C) 2014 PEDRO AXELRUD
#
# All rights reserved - Do Not Redistribute
#

template "/etc/init/resque-web.conf" do
  source "resque-web.conf.erb"
  mode "0755"
end

service 'resque-web' do
  action [:start]
  provider Chef::Provider::Service::Upstart
end
