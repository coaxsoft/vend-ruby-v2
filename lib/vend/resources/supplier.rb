# Suppliers
# https://docs.vendhq.com/reference#suppliers-2

module Vend
  class Supplier < Resource
    include Vend::ResourceActions.new uri: 'suppliers'
  end
end
