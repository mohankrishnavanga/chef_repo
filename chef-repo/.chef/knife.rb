# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "theloneranger"
client_key               "#{current_dir}/theloneranger.pem"
validation_client_name   "lonestudios-validator"
validation_key           "#{current_dir}/lonestudios-validator.pem"
chef_server_url          "https://api.chef.io/organizations/lonestudios"
cookbook_path            ["#{current_dir}/../cookbooks"]
