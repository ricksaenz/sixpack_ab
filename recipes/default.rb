#
# Cookbook Name:: Sixpack
# Recipe:: default
#
# Copyright (C) 2014 Rick Saenz
#
# All rights reserved - Please Redistribute
#

include_recipe "python::default"
include_recipe "redisio::install"
include_recipe "redisio::enable"

include_recipe "python::default"
include_recipe "redisio::install"
include_recipe "redisio::enable"
include_recipe "git"

git "/usr/src/sixpack" do
  repository node[:sixpack_ab][:sixpack][:repo]
  reference node[:sixpack_ab][:sixpack][:branch]
  action :sync
end

python_virtualenv "/var/sixpack" do
  owner "root"
  group "root"
  action :create
end

python_pip "/usr/src/sixpack" do
  virtualenv "/var/sixpack"
  options '-e'
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
  variables( :bin_folder => '/var/sixpack/bin')
  mode "0755"
end

template "/etc/init.d/sixpack-web" do
  source "sixpack-web.daemon.erb"
  variables( :bin_folder => '/var/sixpack/bin')
  mode "0755"
end

service "sixpack" do
  supports :status => true, :restart => true
  action [ :enable, :restart ]
end

service "sixpack-web" do
  supports :status => true, :restart => true
  action [ :enable, :restart ]
end


