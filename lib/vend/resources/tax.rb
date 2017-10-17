# Taxes
# https://docs.vendhq.com/reference#taxes

module Vend
  class Tax < Resource
    include Vend::ResourceActions.new uri: 'taxes'
  end
end
