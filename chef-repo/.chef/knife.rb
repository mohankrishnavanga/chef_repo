# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "admin_mk"
client_key               "#{current_dir}/admin_mk.pem"
validation_client_name   "tls-validator"
validation_key           "#{current_dir}/tls-validator.pem"
chef_server_url          "https://ec2-54-169-36-51.ap-southeast-1.compute.amazonaws.com/organizations/tls"
cookbook_path            ["#{current_dir}/../cookbooks"]