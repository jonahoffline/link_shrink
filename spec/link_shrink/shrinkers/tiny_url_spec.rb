require 'spec_helper'

describe LinkShrink::Shrinkers::TinyUrl do
  include_examples 'shared_examples'

  let(:link_shrink) { described_class.new }
  let(:tiny_url) { 'http://tinyurl.com/api-create.php' }

  describe '#sub_klass' do
    it 'returns the inherited subclass name' do
      expect(link_shrink.sub_klass).to eq('TinyUrl')
    end
  end

  describe '#base_url' do
    it 'returns the base_url for the API' do
      expect(link_shrink.base_url)
      .to eq(tiny_url)
    end
  end

  describe '#api_url' do
    it 'returns full api url' do
      link_shrink.stub(:url).and_return('www.google.com')

      expect(link_shrink.api_url)
      .to eq('http://tinyurl.com/api-create.php?url=www.google.com')
    end
  end

  describe '#api_query_parameter' do
    it 'returns query parameter' do
      link_shrink.stub(:url).and_return('www.google.com')
      expect(link_shrink.api_query_parameter).to eq('?url=www.google.com')
    end
  end

  describe '#content_type' do
    it 'returns text/plain' do
      expect(link_shrink.content_type).to eq('text/plain')
    end
  end
end
