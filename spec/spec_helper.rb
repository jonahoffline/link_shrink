require 'link_shrink'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.order = 'random'
end

def fixture(file)
  file_path = File.join(File.dirname(__FILE__), 'fixtures', "#{file}")
  File.open(file_path).read
end
