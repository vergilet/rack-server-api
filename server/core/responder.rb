require 'oj'
require 'sequel'
require 'logger'
require 'pg'
require 'yaml'

module Server
  module Core
    class Responder
      DB = Sequel.connect({adapter: :postgres,
      host: 'ec2-79-125-119-70.eu-west-1.compute.amazonaws.com',
      port: 5432,
      database: 'd9pseukhs9ukkm',
      user: 'pruwpijfbzumyl',
      password: 'ff435e3a4ac5a829b4b7f39e845af3d66c8a404a9de521387ca1faefc1201ad5',
      max_connections: 10}.merge(logger: ::Logger.new('log/db.log')))

      class << self
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

      def db_table
        DB[db_table_name]
      end

      def db_table_name
        Object.const_get(self.class.to_s.split('::').first).class_variable_get(:@@db_table_name)
      end

      def call; end

      def to_rack_array
        [http_response_code, http_response_headers, http_response_body]
      end

      def response_code
        @response_code || default_response_code
      end

      attr_reader :headers

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