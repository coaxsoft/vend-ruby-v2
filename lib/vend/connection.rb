module Vend
  module Connection
    HEADERS = {
      'accept' => 'application/json'
    }.freeze

    def self.build(config)
      Faraday.new(url: config.api_url) do |conn|
        conn.options[:timeout] = 120
        conn.request config[:request_type] || :json
        conn.headers = HEADERS
        conn.use Vend::Middleware::Auth, config
        conn.use Vend::Middleware::HttpException
        conn.adapter Faraday.default_adapter
      end
    end
  end
end
