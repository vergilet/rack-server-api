require './server/core/read'

module Server
  module Actions
    class Show < ::Server::Core::Read
      def fetch
        @response_code = 404 unless user = DB[@@name].first(id: params[:id])
        user
      end
    end
  end
end
