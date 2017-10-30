# Customers
# https://docs.vendhq.com/reference#customers-2

module Vend
  class Customer < Resource
    include Vend::ResourceActions.new uri: 'customers'

    def self.all_v0_9(params = {})
      get 'customers', params
    end
  end
end
