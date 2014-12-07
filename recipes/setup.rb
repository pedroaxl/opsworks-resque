#
# Cookbook Name:: opsworks-resque
# Recipe:: default
#
# Copyright (C) 2014 PEDRO AXELRUD
#
# All rights reserved - Do Not Redistribute
#

template "/etc/init/resque.conf" do
  source "resque.conf.erb"
  mode '0644'
end

node[:deploy].each do |application, deploy|

  Chef::Log.info("Configuring resque for application #{application}")

  env = (deploy[:environment] || {}).map{|k,v| "#{k}='#{v}'"}.join(' ')

  settings = node[:resque][application]
  # configure rails_env in case of non-rails app
  deploy[:rails_env] ||= settings[:rails_env]
  settings[:workers].each do |queue, quantity|

    quantity.times do |idx|
      idx = idx + 1 # make index 1-based
      
      Chef::Log.info("Configuring resque for #{queue} with #{quantity} workers (idx #{idx})")
      
      template "/etc/init/resque-#{application}-#{idx}.conf" do
        source "resque-n.conf.erb"
        mode '0644'
        variables env: env, application: application, deploy: deploy, queue: queue, instance: idx
      end
    end
  end
end