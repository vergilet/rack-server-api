require_relative 'shared/default_attributes'
require './server/core/write'

module Server
  module Actions
    class Patch < ::Server::Core::Write

      include DefaultAttributes

      def default_response_code
        200
      end

      def success
        DB[@@name].where(id: params[:id]).update(params.merge(default_updated_at))
        DB[@@name].first(id: params[:id])
      end
    end
  end
end
