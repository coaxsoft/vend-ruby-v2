# PaymentTypes
# https://docs.vendhq.com/reference#payment-types

module Vend
  class PaymentType < Resource
    include Vend::ResourceActions.new uri: 'payment_types'
  end
end
