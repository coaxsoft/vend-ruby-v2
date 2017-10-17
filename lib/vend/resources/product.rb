# Products
# https://docs.vendhq.com/reference#products-2

module Vend
  class Product < Resource
    include Vend::ResourceActions.new uri: 'products'

    def self.inventory(resource_id, params = {})
      include Vend::ResourceActions.new uri: "products/#{resource_id}/inventory"
      get path.build, params
    end
  end
end
