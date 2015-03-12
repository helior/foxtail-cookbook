#
# Cookbook Name:: Foxtail Cookbook
# Recipe:: apache
#
# Copyright (C) 2015 Chiru Chakka
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2"

apache_site "default" do
  enable true
end  
