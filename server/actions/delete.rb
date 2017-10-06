require './server/core/write'

module Server
  module Actions
    class Delete < ::Server::Core::Write
      def default_response_code
        204
      end

      def success
        if db_table.first(id: params[:id])
          db_table.where(id: params[:id]).delete
        else
          @response_code = 404
          nil
        end
      end
    end
  end
end
