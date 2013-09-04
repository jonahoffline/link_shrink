require 'spec_helper'

describe LinkShrink do
  include_examples 'shared_examples'

  describe '.shrink_url', :vcr => 'google_url' do
    it 'creates a short url' do
      expect(link_shrink.shrink_url(url)).to eq(short_url)
    end

    context 'when called with additional options' do
      context 'json option' do
        it 'returns JSON when set to true' do
          expect(link_shrink.shrink_url(url, { :json => true }))
          .to eq(json_response)
        end

        it 'returns default response when set to false' do
          expect(link_shrink.shrink_url(url, { json: false }))
          .to eq(short_url)
        end
      end

      context 'qr_code option' do
        it 'returns QR code when set to true' do
          expect(link_shrink.shrink_url(url, { qr_code: true }))
          .to eq(qrcode_url)
        end

        it 'returns default response when set to false' do
          expect(link_shrink.shrink_url(url, { qr_code: false }))
          .to eq(short_url)
        end
      end

      it 'returns default response when called with empty hash' do
        expect(link_shrink.shrink_url(url, {})).to eq(short_url)
      end
    end

    context 'when called with json and qr_code options' do
      it 'returns qr_code in JSON' do
        expect(link_shrink.shrink_url(url, { :json => true, :qr_code => true }))
        .to eq(json_qr_code)
      end
    end

    context 'when called with image_size: 200x200' do
      it 'returns QR code link with custom size' do
        expect(link_shrink.shrink_url(url, {:qr_code => true, :image_size => "200x200"}))
        .to eq(chart_url)
      end
    end

    context 'when called with json, qr_code and image_size: 300x300' do
      let(:options) { { json: true, qr_code: true, image_size: "300x300" } }

      it 'returns QR code in JSON with custom size' do
        expect(link_shrink.shrink_url(url, options))
        .to eq(json_qr_code_custom)
      end
    end
  end

  describe '.generate_qr_code' do
    it 'creates a QR code' do
      expect(link_shrink.generate_qr_code(url)).to eq(qrcode_url)
    end

    context 'when called with image_size: 200x200' do
      it 'returns QR code with custom size' do
        expect(link_shrink.generate_qr_code(url, { image_size: "200x200" }))
        .to eq(chart_url)
      end
    end
  end

  describe '.configure' do
    it 'yields to Config' do
      link_shrink.should_receive(:configure).and_yield(Config)
      link_shrink.configure { |config| api = 'TinyURL' }
    end
  end
end
