# Sale
# https://docs.vendhq.com/reference#sales

module Vend
  class Sale < Resource
    include Vend::ResourceActions.new uri: 'sales'

    def self.create(params = {})
      post 'register_sales', params
    end
  end
end
