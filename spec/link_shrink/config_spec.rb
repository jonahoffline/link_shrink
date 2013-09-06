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
      link_shrink = LinkShrink
      link_shrink.configure { |c| c.api = 'Google' }
      expect(link_shrink::Config.api.class).to eq(LinkShrink::Shrinkers::Google)
    end

    context 'by default api is set to Google' do
      it 'returns api name' do
        expect(link_shrink.api).to be_a(LinkShrink::Shrinkers::Google)
      end
    end
  end

end