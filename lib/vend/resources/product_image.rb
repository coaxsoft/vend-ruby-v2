# Product Images
# https://docs.vendhq.com/reference#product-images

module Vend
  class ProductImage < Resource
    include Vend::ResourceActions.new uri: 'product_images'
  end
end
