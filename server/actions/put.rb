require './server/core/write'

module Server
  module Actions
    class Put < ::Server::Core::Write
      def default_response_code
        201
      end

      def success
        if instance = db_table.where(id: params[:id])
          instance.update(params.merge(default_updated_at))
          @response_code = 204
          nil
        else
          db_table.insert(params.merge(default_attributes))
        end
      end
    end
  end
end
