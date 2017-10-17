RSpec.describe Vend do
  let(:middleware) do
    api.instance_variable_get('@builder').instance_variable_get('@handlers')
  end

  it 'should return a faraday object when configured' do
    Vend.configure do |config|
      config.api_key = '12345'
    end
    expect(Vend.api).to be_a_kind_of(Faraday::Connection)
  end

  describe '.build_connection' do
    let(:api) do
      Vend.configure do |config|
        config.api_key = '12345'
      end
    end

    it 'should have the correct auth middleware' do
      expect(middleware).to include(Vend::Middleware::Auth)
    end
  end
end
