require 'spec_helper'

describe LinkShrink::Request do
  include_examples 'shared_examples'
  let(:shrinker) { LinkShrink::Config.api }
  let(:json_default) {{ :json => false }}

  describe '.process_request' do
    it 'calls request and returns short link' do
      expect(link_shrink.process_request(url, json_default, shrinker))
      .to eq(short_url)
    end

    #it 'calls request and returns short link' do
    #  expect(link_shrink.process_request(url)).to eq(short_url)
    #end

    context 'when called with qr_code true, image_size 300x300' do
      it 'returns QR code with custom size' do
        options = { json: true, qr_code: true, image_size: '300x300' }
        expect(link_shrink.process_request(url, options))
        .to eq(json_qr_code_custom)
      end
    end
  end

  describe '.process_response' do
    context 'when called with json true' do
      it 'returns json' do
        response = link_shrink.request(url, shrinker).body
        expect(link_shrink.process_response(response, {json: true}, shrinker))
        .to eq(json_response)
      end
    end

    context 'when called with json false or no options' do
      it 'returns link' do
        response = link_shrink.request(url, shrinker).body
        expect(link_shrink.process_response(response, json_default, shrinker))
        .to eq(short_url)
      end
    end

    context 'when called with qr_code true' do
      it 'returns QR code' do
        response = link_shrink.request(url, shrinker).body
        expect(link_shrink.process_response(response, { qr_code: true }, shrinker))
        .to eq(qrcode_url)
      end
    end
  end

  describe '.request' do
    it 'is a Typhoeus::Request instance' do
      expect(link_shrink.request(url, shrinker))
      .to be_kind_of(Typhoeus::Response)
    end
  end
end
