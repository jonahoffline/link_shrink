require 'simplecov'
require 'simplecov-gem-adapter'

SimpleCov.start 'gem'
require 'shared_examples'
require 'link_shrink'

RSpec.configure do |config|
  #config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.order = 'random'
end
