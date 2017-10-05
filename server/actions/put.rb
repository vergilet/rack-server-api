require_relative 'shared/default_attributes'
require './server/core/write'

module Server
  module Actions
    class Put < ::Server::Core::Write

      include DefaultAttributes

      def default_response_code
        201
      end

      def success
        if instance = DB[@@name].where(id: params[:id])
          instance.update(params.merge(default_updated_at))
          @response_code = 204
          return
        else
          DB[@@name].insert(params.merge(default_attributes))
        end
      end
    end
  end
end
