require 'spec_helper'

describe LinkShrink::Config do
  include_examples 'shared_examples'

  let(:link_shrink) { described_class }

  describe '#api_key' do
    it 'sets api_key' do
      link_shrink.api_key = '12345'
      expect(link_shrink.api_key).to eq('12345')
    end
  end

  describe '#api' do
    it 'sets api' do
      link_shrink.api = LinkShrink::Shrinkers::Google
      expect(link_shrink.api).to eq(LinkShrink::Shrinkers::Google)
    end
  end

end