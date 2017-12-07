require 'bundler/setup'
require 'resin/client' # and any other gems you need
require 'pry'
require 'yaml'

RSpec.configure do |config|
  # some (optional) config here


  config.before :each do
    @token = "foo"#conf["resin_token"]
  end
end