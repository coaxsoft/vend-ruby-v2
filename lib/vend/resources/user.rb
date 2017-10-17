# Users
# https://docs.vendhq.com/reference#users-2

module Vend
  class User < Resource
    include Vend::ResourceActions.new uri: 'users'
  end
end
