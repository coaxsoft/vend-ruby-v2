# Search
# https://docs.vendhq.com/reference#search

module Vend
  class Search < Resource
    include Vend::ResourceActions.new uri: 'search'
  end
end
