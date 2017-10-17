# Brands
# https://docs.vendhq.com/reference#brands

module Vend
  class Brand < Resource
    include Vend::ResourceActions.new uri: 'brands'
  end
end
