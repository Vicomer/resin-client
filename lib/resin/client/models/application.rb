module Resin
  module Models
    class Application
      def initialize(json)
        @name = json[:name]
      end
    end
  end
end
