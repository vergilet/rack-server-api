require_relative 'shared/default_attributes'
require './server/core/write'

module Server
  module Actions
    class Create < ::Server::Core::Write

      include DefaultAttributes

      def default_response_code
        201
      end

      def success
        DB[@@name].insert(params.merge(default_attributes))
      end
    end
  end
end
