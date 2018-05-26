require './server/core/read'

module Server
  module Actions
    class Index < ::Server::Core::Read
      def fetch
        db_table.all
      end
    end
  end
end
