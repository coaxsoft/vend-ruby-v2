RSpec.describe Vend::Request do
  before do
    module Vend
      class DummyClass
        include Request.new('0.9', 'foo/%d')
      end
    end
    @klass = Vend::DummyClass
  end

  describe '.path' do
    it 'should have a path method to expose the path_builder' do
      expect(@klass.path).to be_kind_of Vend::PathBuilder
    end
  end

  describe 'ClassMethods' do
    before do
      double Vend.api
    end

    let(:json) { "{\"body\":[{\"time\":1426184190},{\"time\":1426184190}]}" }

    describe '.get' do
      it 'should call raw_request and build_response_object' do
        allow(@klass).to receive(:raw_request) { json }
        expect(@klass).to receive(:raw_request).with(:get, @klass.path, {})
        expect(@klass).to receive(:build_response_object).with(json)
        @klass.get(@klass.path, {})
      end
    end

    describe '.delete' do
      it 'should call raw_request' do
        response = double
        allow(response).to receive(:body) { '' }
        allow(@klass).to receive(:raw_request) { response }
        expect(@klass).to receive(:raw_request).with(:delete, @klass.path, {})
        @klass.delete(@klass.path)
      end
    end

    describe '.post' do
      it 'should call raw_request and build_response_object' do
        allow(@klass).to receive(:raw_request) { json }
        expect(@klass).to receive(:raw_request).with(:post, @klass.path, {})
        expect(@klass).to receive(:build_response_object).with(json)
        @klass.post(@klass.path, {})
      end
    end

    describe '.put' do
      it 'should call raw_request and build_response_object' do
        allow(@klass).to receive(:raw_request) { json }
        expect(@klass).to receive(:raw_request).with(:put, @klass.path, {})
        expect(@klass).to receive(:build_response_object).with(json)
        @klass.put(@klass.path, {})
      end
    end

    describe '.raw_request' do
      before do
        Vend.configure do |config|
          config.client_id = 'sdbgksjbg4'
          config.access_token = 'jkdgbdsgbg'
          config.store_hash = 'sdgjnsdjg'
        end
        @api = Vend.api
      end

      it 'send its method to Vend.api' do
        response = double
        allow(@api).to receive(:get) { response }
        expect(@api).to receive(:get).with('path/1', {})
        @klass.raw_request(:get, 'path/1')
      end
    end

    describe 'private methods' do
      describe '.build_response_object' do
        before do
          module Vend
            class DummyClass
              include Request.new(0.9, 'foo/%d')
              def initialize(params)
                @params = params
              end
            end
          end
          @klass_with_init = Vend::DummyClass
        end

        describe 'json array' do
          let(:json) do
            "[{\"time\":1426184190},{\"time\":1426184190}]"
          end

          it 'should build an array of objects' do
            response = double
            allow(response).to receive(:body) { json }
            objs = @klass_with_init.send(:build_response_object, response)
            expect(objs).to be_kind_of Array
          end
        end
        describe 'json object' do
          let(:json) do
            "{\"time\":1426184190}"
          end
          it 'should build an object' do
            response = double
            allow(response).to receive(:body) { json }
            objs = @klass_with_init.send(:build_response_object, response)
            expect(objs).to be_kind_of Object
          end
        end
      end

      describe '.parse' do
        describe 'empty string' do
          let(:json) { "" }

          it 'should return an array' do
            expect(@klass.send(:parse, json)).to be_kind_of Array
          end
        end

        describe 'valid json' do
          let(:json) { "{\"time\":1426184190}" }

          it 'should symbolize keys' do
            expect(@klass.send(:parse, json)).to eq({time:1426184190})
          end

          it 'should return a hash' do
            expect(@klass.send(:parse, json)).to be_kind_of Hash
          end
        end
      end
    end
  end
end

describe Vend::PathBuilder do
  let(:uri) { 'bar' }
  before do
    @path_builder = Vend::PathBuilder.new uri
  end

  describe '.to_s' do
    it 'should return uri' do
      expect(@path_builder.to_s).to eq uri
    end
  end

  describe '.build' do
    context 'hash of keys' do
      let(:keys) { 1 }
      it 'should build a formed path' do
        expect(@path_builder.build keys).to eq 'bar/1'
      end
    end

    context 'integer keys' do
      let(:keys) { 1 }
      it 'should build a formed path' do
        expect(@path_builder.build keys).to eq 'bar/1'
      end
    end

    context 'integer keys' do
      let(:keys) { nil }
      it 'should build a formed path' do
        expect(@path_builder.build keys).to eq 'bar'
      end
    end
  end
end
