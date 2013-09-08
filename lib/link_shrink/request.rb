require 'typhoeus'

module LinkShrink
  # @author Jonah Ruiz <jonah@pixelhipsters.com>
  # Handles request and calls parser
  module Request
    def self.included(base)
      base.extend self
    end

    module_function

    def process_request(url, options, shrinker = LinkShrink::Config.api)
      parse(request(url, shrinker).body, options, shrinker)
    end

    def parse(response, options, shrinker)
      if shrinker.content_type.eql?('text/plain')
        response
      else
        process_response(response, options, shrinker)
      end
    end

    def process_parse_options(parsed_json, shrinker)
      if shrinker.collection_key && shrinker.url_key
        parsed_json.fetch(shrinker.collection_key).fetch(shrinker.url_key)
      else
        parsed_json.fetch(shrinker.url_key)
      end
    end

    def process_response(response, options, shrinker, json = JSONParser)
      option      = Options.new(options)
      parsed_json = json.parse_json(response)
      plain       = process_parse_options(parsed_json, shrinker.class)

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
    def request(new_url, shrinker)
      shrinker.url = new_url
      Typhoeus::Request.new(
        shrinker.api_url,
        method:  shrinker.http_method,
        body:    shrinker.body_parameters(shrinker.url),
        headers: { 'Content-Type' => shrinker.content_type }
      ).run
    end
  end
end
