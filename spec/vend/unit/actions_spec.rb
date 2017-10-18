RSpec.describe Vend::ResourceActions do
  before do
    module Vend
      class DummyClass
        include ResourceActions.new(uri: 'http://foo.bar')
      end
    end
    @klass = Vend::DummyClass
  end

  let(:params) do
    { page: 1 }
  end

  it 'should have options' do
    mod = Vend::ResourceActions.new(
      uri: 'http://foo.bar',
      disable: [:find,:all]
    )
    options = {
      uri: 'http://foo.bar',
      disable: [:find,:all]
    }
    expect(mod._options).to eq options
  end

  describe '.all' do
    it 'should make a get request to the correct route with query params' do
      expect(@klass).to receive(:get).with('http://foo.bar', page: 1)
      @klass.all(params)
    end

    it 'should make a get request to the correct route' do
      expect(@klass).to receive(:get).with('http://foo.bar', {})
      params.delete(:params)
      @klass.all
    end
  end

  describe '.find' do
    it 'should make a get request to the correct route' do
      expect(@klass).to receive(:get).with('http://foo.bar/1', {})
      @klass.find(1)
    end
  end

  describe '.create' do
    it 'should make a post request to the correct route with params' do
      expect(@klass).to receive(:post).with('http://foo.bar', page: 1)
      @klass.create(params)
    end
  end

  describe '.update' do
    it 'should make a put request to the correct route with params' do
      expect(@klass).to receive(:put).with('http://foo.bar/1', page: 1)
      @klass.update(1, params)
    end
  end

  describe '.destroy' do
    it 'should make a delete request to the correct route with params' do
      expect(@klass).to receive(:delete).with('http://foo.bar/1', {})
      @klass.destroy(1)
    end
  end
end
