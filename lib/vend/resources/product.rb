# Products
# https://docs.vendhq.com/reference#products-2

module Vend
  class Product < Resource
    include Vend::ResourceActions.new uri: 'products'

    def self.find_v0_9(resource_id, params = {})
      get "products/#{resource_id}", params
    end

    def self.update(params = {})
      post 'products', params
    end

    def self.inventory(resource_id, params = {})
      get "2.0/products/#{resource_id}/inventory", params
    end

    def self.update_inventory(params = {})
      post 'products', params
    end

    def self.image_upload(resource_id, params)
      connection = params[:connection] || Vend.api
      response = connection.post do |req|
        req.url "2.0/products/#{resource_id}/actions/image_upload"
        req.body = { image: params[:image] }
      end
      Oj.load(response.body, symbol_keys: true)
    end
  end
end
