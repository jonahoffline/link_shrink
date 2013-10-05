require 'spec_helper'

describe LinkShrink::Request do
  include_examples 'shared_examples'
  before :each do
    LinkShrink.configure { |c| c.api = 'Google'}
  end

  let(:shrinker) { LinkShrink::Config.api }

  describe '.request' do
    it 'is a Typhoeus::Request instance' do
      expect(link_shrink.request(url, shrinker))
      .to be_kind_of(Typhoeus::Response)
    end
  end

  describe '#parse' do
    context 'when response is text/plain' do
      it 'returns response' do
        LinkShrink.configure { |c| c.api = 'TinyUrl' }
        response = link_shrink.request(url, shrinker).body

        expect(link_shrink.parse(response, shrinker))
        .to eq('http://tinyurl.com/1c2')
        LinkShrink.configure { |c| c.api = 'Google' }
      end
    end
  end
end
