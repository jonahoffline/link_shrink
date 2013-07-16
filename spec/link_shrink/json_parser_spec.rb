require 'spec_helper'

describe LinkShrink::JSONParser do
  include_examples 'shared_examples'

  describe '.parse_json' do
    it 'delegates to the JSON parser' do
      expect(link_shrink.parse_json(json_response))
      .to eq(parsed_json)
    end
  end

  describe '.cleanup_json' do
    let(:json) { "{\n \"kind\": \"urlshortener#url\",\n \"id\": \"http://goo.gl/fbsS\",\n \"longUrl\": \"http://www.google.com/\"\n}\n" }

    it 'cleans JSON response' do
      expect(link_shrink.cleanup_json(json))
      .to eq('{"kind":"urlshortener#url","id":"http://goo.gl/fbsS","longUrl":"http://www.google.com/"}')
    end
  end
end
