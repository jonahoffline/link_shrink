module LinkShrink
  module Config
    # @author Jonah Ruiz <jonah@pixelhipsters.com>
    # Configurable module for integrating with other URL APIs
    extend self

    # Returns and Sets API key to be used
    # @param api_key [String] API key to be used
    attr_accessor :api_key

    # Sets API to be used
    # @param api [String or Symbol] api to be used
    def api=(api)
      @api = LinkShrink::Shrinkers.const_get(api).new
    end

    # Returns API used
    # Unless an API is defined, it returns Google by default
    # @return [LinkShrink::Shrinkers::Google] instance
    def api
      @api || LinkShrink::Shrinkers::Google.new
    end
  end
end