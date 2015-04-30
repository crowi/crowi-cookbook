require 'serverspec'
require 'infrataster/rspec'
require 'json'

set :backend, :exec

Infrataster::Server.define(:app, '127.0.0.1')
$ohai = JSON.load(`ohai`)
