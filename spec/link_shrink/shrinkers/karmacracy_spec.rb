require 'spec_helper'

describe LinkShrink::Shrinkers::Karmacracy do
  include_examples 'shared_examples'

  let(:link_shrink) { described_class.new }
  let(:karmacracy) { 'http://kcy.me/api/' }
  let(:key) { ENV['KARMACRACY_URL_KEY'] }
  let(:username) { ENV['KARMACRACY_USERNAME'] }
  let(:long_url) { 'http://www.google.com' }

  describe '#sub_klass' do
    it 'returns the inherited subclass name' do
      expect(link_shrink.sub_klass).to eq('Karmacracy')
    end
  end

  describe '#base_url' do
    it 'returns the base_url for the API' do
      expect(link_shrink.base_url).to eq(karmacracy)
    end
  end

  describe '#api_key' do
    it 'returns the API key' do
      expect(link_shrink.api_key).to eq(key)
    end
  end

  describe '#api_url' do
    it 'returns full api url' do
      link_shrink.stub(:url).and_return(long_url)
      url ="#{karmacracy}?u=#{username}&key=#{key}&format=json&url=#{long_url}"

      expect(link_shrink.api_url).to eq(url)
    end
  end

  describe '#api_query_parameter' do
    it 'returns query parameter' do
      link_shrink.stub(:url).and_return(long_url)

      expect(link_shrink.api_query_parameter)
        .to eq("?u=#{username}&key=#{key}&format=json&url=#{long_url}")
    end
  end

  describe '#content_type' do
    it 'returns text/plain' do
      expect(link_shrink.content_type).to eq('application/json')
    end
  end

  describe '#collection_key' do
    it 'returns key of collection' do
      expect(link_shrink.class.collection_key).to eq('data')
    end
  end

  describe '#url_key' do
    it 'returns key used to extract data from response' do
      expect(link_shrink.class.url_key).to eq('url')
    end
  end

  context 'integration' do
    it 'returns correct shortUrl' do
      link_shrink.stub(:url).and_return(long_url)
      LinkShrink.configure { |config| config.api = 'Karmacracy' }

      expect(LinkShrink.shrink_url('www.google.com'))
        .to eq('http://kcy.me/x3o2')
    end
  end
end
