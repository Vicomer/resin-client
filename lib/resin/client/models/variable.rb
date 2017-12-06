module Resin
  module Models
    class Variable

      attr_reader :id, :env_var_name, :value

      def initialize(json)
        @id = json['id']
        @name = json['env_var_name']
        @value = json['value']
      end
    end
  end
end

