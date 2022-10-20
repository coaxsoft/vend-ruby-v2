require 'faraday'
require 'vend/exception'

module Vend
  module Middleware
    class HttpException < Faraday::Middleware
      include Vend::HttpErrors

      def on_complete(env)
        throw_http_exception! env[:status].to_i, env
        env
      end
    end
  end
end
