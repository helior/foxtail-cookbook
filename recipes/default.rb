#
# Cookbook Name:: Foxtail Cookbook
# Recipe:: default
#
# Copyright (C) 2015 Helior Colorado
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nodejs"
include_recipe "apache2"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "git"

group node['foxtail']['group']

user node['foxtail']['user'] do
  group node['foxtail']['group']
  system true
  shell '/bin/bash' 
end

apache_site '000-default' do
  enable false
end

template "#{node['apache']['dir']}/sites-available/foxtail.conf" do
  source 'apache2.conf.erb'
  notifies :restart, 'service[apache2]'
end

directory node['foxtail']['docroot'] do
  action :create
  recursive true
end

cookbook_file "#{node['foxtail']['docroot']}/index.html" do
  mode '0644'
end

apache_site 'foxtail.conf' do
  enable true
end

mysql_service 'default' do
  version '5.6'
  port '3306'  
  data_dir '/data'
  initial_root_password 'f0xt@i1'  
  notifies :restart, 'mysql_service[default]'  
  action [:create, :start]
end

mysql_config 'default' do
  source 'my.cnf.erb'
  action :create
end

mysql_client 'default' do
  action :create
end  

%w{ php5-fpm }.each do |a_package|
  package a_package
end
