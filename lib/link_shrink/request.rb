require 'typhoeus'

module LinkShrink
  # @author Jonah Ruiz <jonah@pixelhipsters.com>
  # Handles request and calls parser
  module Request
    def self.included(base)
      base.extend self
    end

    module_function

    def process_request(url, shrinker = LinkShrink::Config.api)
      parse(request(url, shrinker).body, shrinker)
    end

    def parse(response, shrinker)
      if shrinker.content_type.eql?('text/plain')
        response
      else
        process_response(response, shrinker)
      end
    rescue
      "Error #{response}"
    end

    def process_parse_options(parsed_json, shrinker)
      if shrinker.collection_key && shrinker.url_key
        parsed_json
          .fetch(shrinker.collection_key)
          .fetch(shrinker.url_key)
      else
        parsed_json.fetch(shrinker.url_key)
      end
    rescue
      parsed_json.fetch(shrinker.error_key) { 'Error parsing the request!'}
    end

    def process_response(response, shrinker, json = JSONParser)
      parsed_json = json.parse_json(response)
      process_parse_options(parsed_json, shrinker.class)
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
