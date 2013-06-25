require 'spec_helper'

describe LinkShrink do
  let(:link_shrink) { LinkShrink }
  let(:url) { 'http://www.google.com' }
  let(:short_url) { 'http://goo.gl/fbsS' }
  let(:json) { fixture('response.json') }


  describe '.shrink_url' do
    it 'creates a short url using the API' do
      expect(link_shrink.shrink_url(url)).to eq(short_url)
    end

    context 'when called with additional options' do
      it 'returns response in JSON format when set to true' do
        expect(link_shrink.shrink_url(url, { json: true })).to eq(json)
      end

      it 'returns default response when set to false' do
        expect(link_shrink.shrink_url(url, { :json => false })).to eq(short_url)
      end
    end

  end

  describe '.request' do
    it 'is a Typhoeus::Request instance' do
      expect(link_shrink.request(url))
      .to be_kind_of(Typhoeus::Response)
    end

    it 'sends request to the Google URL Shortner API' do
      response = link_shrink.request(url)

      expect(response.return_code).to eq(:ok)
      expect(response.response_code).to eq(200)
    end
  end

  describe '.parse_json' do
    it 'delegates to the JSON parser' do
      expect(link_shrink.parse_json(json))
      .to eq( {"kind" => "urlshortener#url", "id" => "http://goo.gl/fbsS", "longUrl" => "http://www.google.com/" } )
    end
  end

  describe '.cleanup_json' do
    let(:json) {"{\n \"kind\": \"urlshortener#url\",\n \"id\": \"http://goo.gl/fbsS\",\n \"longUrl\": \"http://www.google.com/\"\n}\n"}

    it 'cleans JSON response' do
      expect(link_shrink.cleanup_json(json))
      .to eq('{"kind":"urlshortener#url","id":"http://goo.gl/fbsS","longUrl":"http://www.google.com/"}')
    end
  end
end