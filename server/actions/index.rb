require './server/core/read'

module Server
  module Actions
    class Index < ::Server::Core::Read
      def fetch
        DB[@@name].all
      end
    end
  end
end
