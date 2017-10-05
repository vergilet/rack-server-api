require 'oj'
require 'sequel'
require 'logger'
require 'pg'

module Server
  module Core
    class Responder

      DB = Sequel.connect(
        adapter: :postgres, host: '127.0.0.1', port: 5432,
        database: 'thesystem_development_heroku', max_connections: 10,
        logger: ::Logger.new('log/db.log')
      )

      class << self
        def db_name(name)
          @@name = name
        end

        def validate_fields(*fields)
          @@fields = fields
        end

        def call(env)
          request = Rack::Request.new(env)
          instance = new(request)
          instance.call
          instance.to_rack_array
        end
      end

      attr_reader :request, :params, :headers

      def initialize(request)
        @request = request
        @params = request.env['router.params']
        @headers = default_response_headers
      end

      def call; end

      def to_rack_array
        [http_response_code, http_response_headers, http_response_body]
      end

      def response_code
        @response_code || default_response_code
      end

      def headers
        @headers
      end

      def body
        {
          code: http_response_code,
          result: @body,
          meta: meta
        }
      end

      private

      def meta
        {
          server_time: Time.now.to_i
        }
      end

      def default_response_code
        200
      end

      def http_response_code
        params['suppress_response_code'] ? 200 : response_code
      end

      def default_response_headers
        { 'Content-Type' => 'application/json' }.dup
      end

      def http_response_headers
        @headers
      end

      def http_response_body
        [Oj.dump(body, mode: :compat)]
      end
    end
  end
end
