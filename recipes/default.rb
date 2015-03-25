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

apache_site '000-default' do
  enable false
end

template "#{node['apache']['dir']}/sites-available/foxtail.conf" do
  source 'apache2.cnf.erb'
  notifies :restart, 'service[apache2]'
end

directory '/var/www/html/foxtail' do
  action :create
  recursive true
end

cookbook_file '/var/www/html/foxtail/index.html' do
  source 'index.html'
  owner "root"
  group node['www-data']['root_group']
  mode '0644' 
end

apache_site "default" do
  enable true
end

apache_site 'foxtail.conf' do
  enable true
end

service "apache2" do
  action :start
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