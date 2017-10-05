require './server/core/responder'

module Server
  module Core
    class Write < Responder
      def call
        @body = valid_params? ? success : failure
      end

      private

      def valid_params?
        @@fields.map { |field| params[field] }.all?
      end

      def success; end

      def failure
        @response_code = 400
        { error: 'Invalid params' }
      end

      def default_updated_at
        { updated_at: Time.now }
      end

      def default_attributes
        { created_at: Time.now }.merge(default_updated_at)
      end
    end
  end
end
