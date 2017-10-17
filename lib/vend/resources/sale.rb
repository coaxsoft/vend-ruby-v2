# Sale
# https://docs.vendhq.com/reference#sales

module Vend
  class Sale < Resource
    include Vend::ResourceActions.new uri: 'sales'
  end
end
