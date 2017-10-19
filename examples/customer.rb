require 'vend'

Vend.configure do |config|
  config.domain_prefix = ENV['VEND_DOMAIN_PREFIX']
  config.access_token = ENV['VEND_ACCESS_TOKEN']
end

# List customers
customers = Vend::Customer.all
puts customers

# Get a Customer
customer = customers[:data].first
puts Vend::Customer.find(customer[:id])

# Create a Customer
customer = Vend::Customer.create(first_name: 'Test', last_name: 'Test')[:data]
puts customer

# Update a Customer
puts Vend::Customer.update(customer[:id], phone: '1234567890')

# Destroy a Customer
puts Vend::Customer.destroy(customer[:id])
