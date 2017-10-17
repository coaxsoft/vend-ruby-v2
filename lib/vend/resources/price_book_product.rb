# PriceBookProducts
# https://docs.vendhq.com/reference#price-book-products

module Vend
  class PriceBookProduct < Resource
    include Vend::ResourceActions.new uri: 'price_book_products'
  end
end
