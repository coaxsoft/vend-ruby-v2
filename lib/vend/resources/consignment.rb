# Consignments
# https://docs.vendhq.com/reference#consignments-2

module Vend
  class Consignment < Resource
    include Vend::ResourceActions.new uri: 'consignments'
  end
end
