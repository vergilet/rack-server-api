require './server/core/responder'

module Server
  module Core
    class Read < Responder
      def call
        @body = fetch
      end
    end
  end
end
