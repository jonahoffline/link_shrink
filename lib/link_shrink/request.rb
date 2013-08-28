require 'typhoeus'

module LinkShrink
  # @author Jonah Ruiz <jonah@pixelhipsters.com>
  # Handles request and calls parser
  module Request
    def self.included(base)
      base.extend self
    end

    module_function

    def process_request(url, options, shrinker = Config.api)
      process_response(request(url, shrinker).body, options, shrinker)
    end

    def process_response(response, options, shrinker, json = JSONParser)
      option      = Options.new(options)
      parsed_json = json.parse_json(response)
      plain       = parsed_json['id']

      if option.json? && option.qr_code?
        if option.image_size?
          return parsed_json.merge(qr_code: shrinker.generate_chart_url(plain, options.fetch(:image_size))).to_json
        end
        return parsed_json.merge(qr_code: shrinker.generate_chart_url(plain)).to_json
      end

      case
        when option.json?
          json.cleanup_json(response)
        when option.qr_code?
          if option.image_size?
            return shrinker.generate_chart_url(plain, options.fetch(:image_size))
          end
          shrinker.generate_chart_url(plain)
        when option.image_size?
          shrinker.generate_chart_url(plain, options.fetch(:image_size))
        else
          plain
      end
    end

    # Calls URL API
    # @see LinkShrink::Shrinkers::Base#api_url
    # @see LinkShrink::Shrinkers::Base#body_parameters
    def request(url, shrinker)
      Typhoeus::Request.new(
        shrinker.api_url,
        method:  :post,
        body:    shrinker.body_parameters(url),
        headers: { 'Content-Type' => 'application/json' }
      ).run
    end
  end
end
