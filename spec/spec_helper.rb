require 'simplecov'
require 'simplecov-gem-adapter'
require 'coveralls'

SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start 'gem'
require 'webmock/rspec'
require 'vcr'
require 'shared_examples'
require 'link_shrink'


VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
  c.default_cassette_options = {
    record: :new_episodes
  }
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.order = 'random'
end

#before :each do
#  VCR.use_cassette 'google_url' do
#    LinkShrink.shrink_url('http://www.google.com')
#  end
#end

#vcr_options = { :cassette_name => 'google_url', :record => :new_episodes }