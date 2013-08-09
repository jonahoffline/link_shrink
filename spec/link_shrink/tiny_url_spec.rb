#require 'spec_helper'
#
#describe LinkShrink::Shrinkers::TinyUrl do
#  include_examples 'shared_examples'
#
#  let(:link_shrink) { LinkShrink::Shrinkers::TinyUrl.new }
#  let(:tiny_url) { 'http://tinyurl.com/api-create.php' }
#
#  describe '#sub_klass' do
#    it 'returns the inherited subclass name' do
#      expect(link_shrink.sub_klass).to eq('TinyUrl')
#    end
#  end
#
#  describe '#base_url' do
#    it 'returns the base_url for the API' do
#      expect(link_shrink.base_url)
#      .to eq(tiny_url)
#    end
#  end
#
#  describe '.request' do
#    it 'integrates with Request' do
#      expect(LinkShrink::Request.request('http://www.google.com',LinkShrink::Shrinkers::TinyUrl.new).body)
#      .to eq('http://tinyurl.com/1c2')
#    end
#  end
#
#  describe '#http_method' do
#    it 'returns default :post' do
#      expect(link_shrink.http_method).to eq(:get)
#    end
#  end
#
#  describe '#content_type' do
#    it 'returns application/json' do
#      expect(link_shrink.content_type).to eq('text/plain')
#    end
#  end
#end