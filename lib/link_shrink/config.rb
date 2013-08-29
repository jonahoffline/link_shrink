module LinkShrink
  module Config
    # @author Jonah Ruiz <jonah@pixelhipsters.com>
    # Configurable module for integrating with other URL APIs
    extend self

    attr_accessor :api_key


    def api=(api)
      @api = api.new
    end

    def api
      @api || LinkShrink::Shrinkers::Google.new
    end
  end
end