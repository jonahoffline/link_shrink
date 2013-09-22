require 'spec_helper'

describe LinkShrink::Shrinkers::Owly do
  include_examples 'shared_examples'

  let(:link_shrink) { described_class.new }
  let(:owly) { 'http://ow.ly/api/1.1/url/shorten' }
  let(:key) { ENV['OWLY_URL_KEY'] }

  describe '#sub_klass' do
    it 'returns the inherited subclass name' do
      expect(link_shrink.sub_klass).to eq('Owly')
    end
  end

  describe '#base_url' do
    it 'returns the base_url for the API' do
      expect(link_shrink.base_url)
      .to eq(owly)
    end
  end

  describe '#api_key' do
    it 'returns the API key' do
      expect(link_shrink.api_key)
      .to eq(key)
    end
  end

  describe '#api_url' do
    it 'returns full api url' do
      link_shrink.stub(:url).and_return('http://www.google.com')

      expect(link_shrink.api_url)
      .to eq("http://ow.ly/api/1.1/url/shorten?apiKey=#{key}&longUrl=http://www.google.com")
    end
  end

  describe '#api_query_parameter' do
    it 'returns query parameter' do
      link_shrink.stub(:url).and_return('http://www.google.com')
      expect(link_shrink.api_query_parameter).to eq("?apiKey=#{key}&longUrl=http://www.google.com")
    end
  end

  describe '#content_type' do
    it 'returns text/plain' do
      expect(link_shrink.content_type).to eq('application/json')
    end
  end

  describe '#collection_key' do
    it 'returns key of collection' do
      expect(link_shrink.class.collection_key).to eq('results')
    end
  end

  describe '#url_key' do
    it 'returns key used to extract data from response' do
      expect(link_shrink.class.url_key).to eq('shortUrl')
    end
  end

  context 'integration' do
    it 'returns correct shortUrl' do
      LinkShrink.configure { |config| config.api = 'Owly' }
      expect(LinkShrink.shrink_url('www.google.com'))
      .to eq('http://ow.ly/22rqvf')
    end
  end
end
