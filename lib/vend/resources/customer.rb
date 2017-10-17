# Customers
# https://docs.vendhq.com/reference#customers-2

module Vend
  class Customer < Resource
    include Vend::ResourceActions.new uri: 'customers'
  end
end
