# Sale
# https://docs.vendhq.com/reference#sales

module Vend
  class Sale < Resource
    include Vend::ResourceActions.new uri: 'sales'

    def self.create(params = {})
      post 'register_sales', params
    end

    def self.return(resource_id, params = {})
      put "/api/2.0/sales/#{resource_id}/actions/return", params
    end

    def self.register_sale(resource_id, params = {})
      get "/api/register_sales/#{resource_id}", params
    end

    def self.finalize_return(params = {})
      post '/api/register_sales', params
    end
  end
end
