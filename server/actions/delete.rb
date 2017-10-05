require './server/core/write'

module Server
  module Actions
    class Delete < ::Server::Core::Write

      def default_response_code
        204
      end

      def success
        if DB[@@name].first(id: params[:id])
          DB[@@name].where(id: params[:id]).delete
        else
          @response_code = 404
          return
        end
      end
    end
  end
end
