require './server/core/write'

module Server
  module Actions
    class Create < ::Server::Core::Write
      def default_response_code
        201
      end

      def success
        db_table.insert(params.merge(default_attributes))
      end
    end
  end
end
