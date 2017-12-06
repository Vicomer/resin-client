module Resin
  module Models
    class Device

      attr_reader :name, :id, :device_type

      def initialize(json)
        @name = json['app_name']
        @id = json['id']
        @device_type = json['device_type']
      end
    end
  end
end

