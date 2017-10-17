RSpec.describe Vend::Middleware::Auth do
  it 'should set the correct headers' do
    app = double
    options = {
      access_token: 'secret_access_token'
    }
    @api = Vend::Middleware::Auth.new(app, options)
    expect(app).to receive(:call).with(
      request_headers: { 'Authorization' => 'Bearer secret_access_token' }
    )
    @api.call(request_headers: {})
  end
end
