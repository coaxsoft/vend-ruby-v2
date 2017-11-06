require 'pry'
require 'hashie'
require 'faraday_middleware'
require 'oj'
require 'vend/version'
require 'vend/config'
require 'vend/connection'
require 'vend/exception'
require 'vend/request'
require 'vend/resource_actions'
require 'vend/middleware/auth'
require 'vend/middleware/http_exception'
require 'vend/oauth2/auth_code'
require 'vend/resources/resource'

module Vend
  resources = File.join(File.dirname(__FILE__), 'vend', 'resources', '**', '*.rb')
  Dir.glob(resources, &method(:require))

  class << self
    attr_reader :api, :config

    def configure
      @config = Vend::Config.new.tap { |h| yield(h) }
      @api = Vend::Connection.build(@config)
    end
  end
  # Your code goes here...
end
