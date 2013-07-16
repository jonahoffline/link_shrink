require 'spec_helper'

describe LinkShrink::Shrinkers::Google do
  include_examples 'shared_examples'

  let(:link_shrink) { described_class.new }
  let(:google_url) { 'https://www.googleapis.com/urlshortener/v1/url' }
  let(:key) { ENV['GOOGLE_URL_KEY'] }

  describe '#sub_klass' do
    it 'returns the inherited subclass name' do
      expect(link_shrink.sub_klass).to eq('Google')
    end
  end

  describe '#base_url' do
    it 'returns the base_url for the API' do
      expect(link_shrink.base_url)
      .to eq(google_url)
    end
  end

  describe '#api_key' do
    it 'returns the API key' do
      expect(link_shrink.api_key)
      .to eq(key)
    end
  end

  describe '#generate_chart_url' do
    let(:chart_url) { "http://chart.googleapis.com/chart?cht=qr&chs=300x300&choe=UTF-8&chld=H&chl=http://goo.gl/fbsS" }

    it 'returns a QR code' do
      expect(link_shrink.generate_chart_url(short_url))
      .to eq(qrcode_url)
    end

    context 'when called with optional image_size argument' do
      it 'returns a QR code with custom image size' do
        expect(link_shrink.generate_chart_url(short_url, '300x300'))
        .to eq(chart_url)
      end
    end
  end

  describe '#body_parameters' do
    it 'returns body parameters for API request' do
      expect(link_shrink.body_parameters("http://www.google.com"))
      .to eq("{\"longUrl\":\"http://www.google.com\"}")
    end
  end
end