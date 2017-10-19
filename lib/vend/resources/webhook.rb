# Webhooks
# https://docs.vendhq.com/reference#webhooks-1

module Vend
  class Webhook < Resource
    include Vend::ResourceActions.new api_version: '0.9', uri: 'webhooks'

    def self.create(params = {})
      response = params[:connection].post do |req|
        req.url '/api/webhooks'
        req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
        req.body = "data=#{params[:data].to_json}"
      end
      JSON.parse(response.body, symbolize_names: true)
    end

    def self.update(resource_id, params = {})
      response = params[:connection].put do |req|
        req.url "/api/webhooks/#{resource_id}"
        req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
        req.body = "data=#{params[:data].to_json}"
      end
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
