#
# Cookbook Name:: Sixpack
# Recipe:: Sixpack Packaged
#
# Copyright (C) 2014 Rick Saenz
#
# All rights reserved - Please Redistribute
#

include_recipe "python::default"

python_pip "sixpack" do
  version "1.1.2"
end

directory "/etc/sixpack" do
  owner "root"
  group "root"
  mode 00644
  action :create
end

template "/etc/sixpack/config.yml" do
  source "sixpack.config.yml.erb"
  mode "0644"
end

template "/etc/init.d/sixpack" do
  source "sixpack.daemon.erb"
  variables( :bin_folder => '/usr/bin')
  mode "0755"
end

template "/etc/init.d/sixpack-web" do
  source "sixpack-web.daemon.erb"
  variables( :bin_folder => '/usr/bin')
  mode "0755"
end

service "sixpack" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end

service "sixpack-web" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end