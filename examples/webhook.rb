require 'vend'

Vend.configure do |config|
  config.domain_prefix = ENV['VEND_DOMAIN_PREFIX']
  config.access_token = ENV['VEND_ACCESS_TOKEN']
end

# List Webhooks
webhooks = Vend::Webhook.all
puts webhooks

# Get a Webhook
webhook = webhooks.first
puts Vend::Webhook.find(webhook[:id])

# Create a Webhook
webhook = Vend::Webhook.create(data: { url: 'https://12345678.ngrok.io', active: false, type: 'product.update' })
puts webhook

# Update a Webhook
puts Vend::Webhook.update(webhook[:id], data: { active: true })

# Destroy a Webhook
puts Vend::Webhook.destroy(webhook[:id])