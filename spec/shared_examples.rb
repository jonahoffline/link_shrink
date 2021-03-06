require 'ostruct'

# @author Jonah Ruiz <jonah@pixelhipsters.com>
# Shared examples used in specs
shared_context 'shared_examples' do
  # Helper method for loading fixtures
  def fixture(file)
    file_path = File.join(File.dirname(__FILE__), 'fixtures', "#{file}")
    File.open(file_path).read
  end

  let(:link_shrink) { described_class }
  let(:url) { 'http://www.google.com' }
  let(:short_url) { "http://goo.gl/fbsS" }

  let(:json_response) { fixture('response.json') }
  let(:parsed_json) { { "kind" => "urlshortener#url", "id" => "http://goo.gl/fbsS", "longUrl" => "http://www.google.com/" } }
end
