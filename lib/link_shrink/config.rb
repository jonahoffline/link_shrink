module LinkShrink
  module Config
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