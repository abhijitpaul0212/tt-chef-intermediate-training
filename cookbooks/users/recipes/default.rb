#
# Cookbook:: users
# Recipe:: default
#
# Copyright:: 2022, The Authors, All Rights Reserved.

## This section utilizes the data-bags method for maintaining secrets
## Comment out the below section if you want to use data-bags method
# my_name_password = data_bag_item('passwords', 'abhijit')

# user 'abhijit' do
#     comment 'abhijit paul'
#     uid 2002
#     home '/home/abhijit'
#     shell '/bin/bash'
#     manage_home true
#     password my_name_password['password'] #Actual Password: paul
# end


## This section utilizes the vault method for maintaining secrets
## Comment out the above section if you want to use vault method
chef_gem 'vault' do
    compile_time true if respond_to?(:compile_time)
end

require 'vault'

Vault.configure do |config|
    config.address = 'http://3.237.235.119:8200'

    config.token = 'hvs.OIS2ATFeN946cqX7Lomwvk8Z'
end

creds = Vault.kv('secret').read('password')

user 'mousumi' do
    comment 'mousumi roy'
    uid 2002
    home '/home/mousumi'
    shell '/bin/bash'
    manage_home true
    password creds.data[:password]  #Actual Password: roy
end