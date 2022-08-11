#
# Cookbook:: users
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

my_name_password = data_bag_item('passwords', 'abhijit')

user 'abhijit' do
    comment 'abhijit paul'
    uid 2002
    home '/home/abhijit'
    shell '/bin/bash'
    manage_home true
    password my_name_password['password']
end
