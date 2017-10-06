require './server/core/write'

module Server
  module Actions
    class Patch < ::Server::Core::Write
      def default_response_code
        200
      end

      def success
        db_table.where(id: params[:id]).update(params.merge(default_updated_at))
        db_table.first(id: params[:id])
      end
    end
  end
end
