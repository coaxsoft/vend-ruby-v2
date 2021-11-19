# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vend/version'

Gem::Specification.new do |spec|
  spec.name = 'vend-ruby-v2'
  spec.version = Vend::VERSION
  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.0.0'
  spec.license = 'MIT'

  spec.authors       = ['Yurkiv Misha']
  spec.email         = ['m.yurkiv@coaxsoft.com']
  spec.summary       = 'Ruby client library for the VendHQ API'
  spec.description   = spec.summary
  spec.homepage = 'https://github.com/coaxsoft/vend-ruby-v2'

  spec.require_paths = ['lib']
  spec.files = Dir['README.md', 'lib/**/*', 'vend.gemspec']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-nc'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'faraday', '~> 1.8.0'
  spec.add_dependency 'faraday_middleware', '~> 1.2.0'
  spec.add_dependency 'hashie', '~> 5.0'
  spec.add_dependency 'jwt', '~> 1.5.4'
  spec.add_dependency 'oauth2'
  spec.add_dependency 'oj'
end
