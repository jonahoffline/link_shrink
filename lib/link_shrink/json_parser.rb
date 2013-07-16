require 'json'

module LinkShrink
  # @author Jonah Ruiz <jonah@pixelhipsters.com>
  # Wraps JSON class
  module JSONParser
    def self.included(base)
      base.extend self
    end

    def self.parse_json(data)
      JSON.load(data)
    end

    def self.cleanup_json(data)
      data.gsub(/\s+/, '')
    end
  end
end