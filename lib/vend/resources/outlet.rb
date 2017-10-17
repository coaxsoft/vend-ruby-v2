# Outlets
# https://docs.vendhq.com/reference#outlets

module Vend
  class Outlet < Resource
    include Vend::ResourceActions.new uri: 'outlets'
  end
end
