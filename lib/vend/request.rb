require 'json'

module Vend
  class PathBuilder
    attr_reader :uri

    def initialize(uri)
      @uri = uri
    end

    def build(key = nil)
      if key
        "#{uri}/#{key}"
      else
        uri
      end
    end

    def to_s
      @uri
    end
  end

  class Request < Module
    def initialize(uri)
      @uri = uri
    end

    def included(base)
      base.extend ClassMethods
      path_builder = PathBuilder.new @uri
      base.define_singleton_method :path do
        path_builder
      end
    end

    module ClassMethods
      def get(path, params = {})
        response = raw_request(:get, path, params)
        build_response_object response
      end

      def delete(path, params = {})
        response = raw_request(:delete, path, params)
        response.body
      end

      def post(path, params = {})
        response = raw_request(:post, path, params)
        build_response_object response
      end

      def put(path, params = {})
        response = raw_request(:put, path, params)
        build_response_object response
      end

      def raw_request(method, path, params = {})
        client = params.delete(:connection) || Vend.api
        client.send(method, path.to_s, params)
      end

      private

      def build_response_object(response)
        parse response.body
      end

      def parse(json)
        return [] if json.empty?
        JSON.parse(json, symbolize_names: true)
      end
    end
  end
end
