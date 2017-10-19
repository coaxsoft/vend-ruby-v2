# Vend::Ruby::V2
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vend-ruby-v2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vend-ruby-v2

## Usage

For full examples of using the API client, please see the [examples folder](examples) and refer to Vend [developer documentation](https://docs.vendhq.com/v0.9/reference).

Example:

```rb
# Configure the client to talk to a given store
Vend.configure do |config|
  config.domain_prefix = ENV['VEND_DOMAIN_PREFIX']
  config.access_token = ENV['VEND_ACCESS_TOKEN']
end

# Make an API request for a given resource
Vend::Customer.all
=> {:data=>
    [{:id=>"0afa8de1-1450-11e7-edec-9df1c629417c",
      :customer_code=>"WALKIN",
      ...
```
### Thread Safety

The `Vend.configure` method is NOT thread-safe. This mechanism is designed for applications or CLI's (command-line interfaces) where thread safety is not a concern. If you need to guarantee thread safety, we support this alternative mechanism to make thread-safe API requests:

Rather then setting up a single `connection` for all API requests, you would construct a new connection for each thread. If you can ensure that each of these connections is stored in a thread-safe manner, you can pass the `connection` as you query the resource.

```rb
connection = Vend::Connection.build(
  Vend::Config.new(
    config.domain_prefix = ENV['VEND_DOMAIN_PREFIX'],
    config.access_token = ENV['VEND_ACCESS_TOKEN']
  )
)
=> #<Faraday::Connection:0x007fbf95068978 ... >>

Vend::Customer.all
=> {:data=>
    [{:id=>"0afa8de1-1450-11e7-edec-9df1c629417c",
      :customer_code=>"WALKIN",
      ...
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/vend-ruby-v2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
