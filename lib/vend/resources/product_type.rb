# ProductTypes
# https://docs.vendhq.com/reference#product_types

module Vend
  class ProductType < Resource
    include Vend::ResourceActions.new uri: 'product_types'
  end
end
