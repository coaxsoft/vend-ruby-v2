# Registers
# https://docs.vendhq.com/reference#registers

module Vend
  class Register < Resource
    include Vend::ResourceActions.new uri: 'registers'
  end
end
