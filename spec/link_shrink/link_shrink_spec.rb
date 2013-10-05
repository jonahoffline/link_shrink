require 'spec_helper'

describe LinkShrink do
  include_examples 'shared_examples'

  before :all do
    LinkShrink.configure { |c| c.api = 'Google' }
  end

  describe '.shrink_url', :vcr => 'google_url' do
    it 'creates a short url' do
      expect(link_shrink.shrink_url(url)).to eq(short_url)
    end
  end

  describe '.configure' do
    context 'when passed a block' do
      it 'yields to Config' do
        expect { |c| link_shrink.configure(&c) }.to yield_control
      end

      it 'sets API Shrinker' do
        link_shrink.should_receive(:configure)
          .and_yield(LinkShrink::Config)

        link_shrink.configure { |config| api = 'TinyURL' }
      end
    end
  end
end
