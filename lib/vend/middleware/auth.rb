module Vend
  module Middleware
    class Auth < Faraday::Middleware
      def initialize(app, options = {})
        @app = app
        @options = options
      end

      def call(env)
        env[:request_headers]['Authorization'] = "Bearer #{@options[:access_token]}"
        @app.call env
      end
    end
  end
end
