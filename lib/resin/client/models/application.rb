module Resin
  module Models
    class Application

      attr_reader :name, :id, :device_type

      def initialize(json)
        @name = json['app_name']
        @id = json['id']
        @device_type = json['device_type']
        @requester = Thread.current[:requester]
      end

      def get_application
        @requester.get('')
      end

      def self.get_applications
        applications = []
        json = Thread.current[:requester].get('application')
        json['d'].each do |application_json|
          applications << Models::Application.new(application_json)
        end
        applications
      end
    end
  end
end

