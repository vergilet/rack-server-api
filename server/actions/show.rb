require './server/core/read'

module Server
  module Actions
    class Show < ::Server::Core::Read
      def fetch
        @response_code = 404 unless instance = db_table.first(id: params[:id])
        instance
      end
    end
  end
end
