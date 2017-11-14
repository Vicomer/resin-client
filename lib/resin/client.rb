require "resin/client/version"
require 'resin/config/envs'
require 'resin/support/requester'
require 'resin/client/models/application'
require 'jsonclient'

module Resin
  class Client

    def initialize(the_token)
      @requester = Requester.new(the_token)
    end

    def get_applications
      applications = []
      json = @requester.get('application')
      json['d'].each do |application_json|
        applications << Models::Application.new(application_json)
      end
      applications
    end
  end
end
