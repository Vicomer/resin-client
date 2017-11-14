require "resin/client/version"
require 'resin/config/envs'
require 'resin/support/requester'
require 'resin/client/models/application'
require 'jsonclient'

module Resin
  class Client

    def initialize(the_token)
      @requester = Requester.new(the_token)
      Thread.current[:requester] = @requester
    end
  end
end
