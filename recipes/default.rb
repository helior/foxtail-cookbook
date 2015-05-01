#
# Cookbook Name:: Foxtail Cookbook
# Recipe:: default
#
# Copyright (C) 2015 Helior Colorado, Chiru Chakka
#
# All rights reserved - Do Not Redistribute
#

node.set['apache']['version'] = '2.4'
node.set["apache"]["pid_file"]  = "/var/run/apache2/apache2.pid"
include_recipe "nodejs"
include_recipe "apache2"
include_recipe "apache2::mod_php5"
include_recipe "apache2::mod_rewrite"
include_recipe "php"
include_recipe "php::module_mysql"
include_recipe "git"
include_recipe "motd"

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


