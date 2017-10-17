RSpec.describe Vend::HttpErrors do
  let(:dummy_class) { Class.new { extend Vend::HttpErrors } }
  let(:code) { 200 }
  let(:env) { double }
  let(:body) { {} }
  let(:headers) { {} }

  before do
    allow(env).to receive(:body) { body }
    allow(env).to receive(:[]) { headers }
  end

  it '::ERRORS is not nil' do
    expect(Vend::HttpErrors::ERRORS).not_to be_nil
  end

  context 'invalid response status' do
    context 'when we get a 404' do
      let(:code) { 404 }

      it 'should throw an exception' do
        expect { dummy_class.throw_http_exception!(code, env) }.to raise_exception(Vend::HttpErrors::ERRORS[code])
      end
    end

    it 'should have a valid error' do
      Vend::HttpErrors::ERRORS.keys.each do |code|
        expect { dummy_class.throw_http_exception!(code, env) }.to raise_exception(Vend::HttpErrors::ERRORS[code])
      end
    end

    context 'when have a body and response headers' do
      let(:body) { JSON.generate({ time: '1426184190' }) }
      let(:headers) { { 'X-Retry-After' => 1 } }
      let(:code) { 429 }

      it 'should parse out a retry-after header if present' do
        begin
          dummy_class.throw_http_exception!(code, env)
        rescue Vend::TooManyRequests => e
          expect(e.response_headers[:retry_after]).to eq 1
        end
      end
    end

    context 'when we get a string body' do
      let(:body) { 'Unauthorized' }
      let(:code) { 401 }

      it 'handle string in body' do
        begin
          dummy_class.throw_http_exception!(code, env)
        rescue Vend::Unauthorized => e
          expect(e.message).to eq body
        end
      end
    end
  end

  context 'valid response status' do
    let(:code) { 200 }

    it 'should not throw an exception' do
      expect { dummy_class.throw_http_exception!(code, env) }.to_not raise_exception
    end
  end
end
