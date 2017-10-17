# Products
# Resources related to the products in the API.
# https://developers.Vend.com/docs/versions/1-0-0-beta/resources/products

module Vend
  class Product < Resource
    include Vend::ResourceActions.new uri: 'products/%d'

    property :id
  end
end
