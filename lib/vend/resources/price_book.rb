# PriceBooks
# https://docs.vendhq.com/reference#price-books

module Vend
  class PriceBook < Resource
    include Vend::ResourceActions.new uri: 'price_books'
  end
end
