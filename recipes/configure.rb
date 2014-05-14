#
# Cookbook Name:: opsworks-resque
# Recipe:: default
#
# Copyright (C) 2014 PEDRO AXELRUD
#
# All rights reserved - Do Not Redistribute
#

@path = node[:resque][:path]


template "/etc/init/resque.conf" do
  source "resque.conf.erb"
  mode "0755"
end

node[:resque][:workers].each_with_index do |queue, index|
  template "/etc/init/resque-#{index}.conf" do
    source "resque-n.conf.erb"
    mode "0755"
  end
end

service 'resque' do
  action [:start]
  provider Chef::Provider::Service::Upstart
end
