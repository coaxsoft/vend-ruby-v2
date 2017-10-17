# Customer Groups
# https://docs.vendhq.com/reference#customer-groups

module Vend
  class CustomerGroup < Resource
    include Vend::ResourceActions.new uri: 'customer_groups'
  end
end
