#
# Cookbook Name:: awesome_customers
# Recipe:: user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
group 'web_admin'

user 'web_admin' do
  group 'web_admin'
  system true
  shell '/bin/bash'
end

