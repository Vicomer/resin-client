require 'bundler/setup'
require 'resin/client' # and any other gems you need
require 'pry'
require 'yaml'

RSpec.configure do |config|
  # some (optional) config here
  conf = YAML.load_file(File.join(File.expand_path(File.dirname(__FILE__)), 'resources/config.yml'))


  config.before :each do
    @token = conf["resin_token"]
  end
end