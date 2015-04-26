
# crowi
default["crowi"]["version"] = "master"
default["crowi"]["base_dir"] = "/srv/www"
default["crowi"]["owner"] = "crowi"
default["crowi"]["group"] = "www-data"

default["crowi"]["env"] = "production"
default["crowi"]["port"] = 3000
default["crowi"]["seed"] = "ThisIsPsswordSeed"
default["crowi"]["token"] = "ThisIsSecretToken"

# mongodb
default['crowi']['mongodb']['username'] = 'crowi'
default['crowi']['mongodb']['password'] = 'crowipass'
default['crowi']['mongodb']['roles'] = %w(readWrite)
default['crowi']['mongodb']['database'] = 'crowi'

default['crowi']['mongodb']['config']['host'] = 'localhost'
default['crowi']['mongodb']['config']['port'] = node['mongodb']['config']['port']

# mongo users override
override['apt']['compile_time_update'] = true
override['build-essential']['compile_time'] = true
override['mongodb']['ruby_gems']['mongo'] = '~> 1.12'

# redis
default['crowi']['redis']['host'] = 'localhost'
default['crowi']['redis']['port'] = '6379' # redis default port.

# nginx
default['crowi']['fqdn'] = node['fqdn']
