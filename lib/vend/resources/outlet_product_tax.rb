# Outlet Product Taxes
# https://docs.vendhq.com/reference#outlet-product-taxes

module Vend
  class OutletProductTax < Resource
    include Vend::ResourceActions.new uri: 'outlet_taxes'
  end
end
