# Webhooks
# https://docs.vendhq.com/reference#webhooks-1

module Vend
  class Webhook < Resource
    include Vend::ResourceActions.new api_version: '0.9', uri: 'webhooks'

    def self.create(params = {})
      make_urlencoded_request(:post, '/api/webhooks', params)
    end

    def self.update(resource_id, params = {})
      make_urlencoded_request(:put, "/api/webhooks/#{resource_id}", params)
    end

    def self.make_urlencoded_request(method, url, params)
      connection = params[:connection] || Vend.api
      response = connection.send(method) do |req|
        req.url url
        req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
        req.body = "data=#{params[:data].to_json}"
      end
      Oj.load(response.body, symbol_keys: true)
    end
  end
end
