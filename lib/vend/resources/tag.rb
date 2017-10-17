# Tags
# https://docs.vendhq.com/reference#tags

module Vend
  class Tag < Resource
    include Vend::ResourceActions.new uri: 'tags'
  end
end
