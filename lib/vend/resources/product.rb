# Products
# https://docs.vendhq.com/reference#products-2

module Vend
  class Product < Resource
    include Vend::ResourceActions.new uri: 'products'

    def self.inventory(resource_id, params = {})
      get "2.0/products/#{resource_id}/inventory", params
    end
  end
end
