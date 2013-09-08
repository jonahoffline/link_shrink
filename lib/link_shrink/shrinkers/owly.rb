require 'json'

module LinkShrink
  module Shrinkers
    # @author Jonah Ruiz <jonah@pixelhipsters.com>
    # Implements Owly's URL Shortener API
    class Owly < Base
      # Defines response structure to be parsed
      response_options do
        collection 'results'
        short_url  'shortUrl'
      end

      # Returns URL base for API
      # @return [String] api base url
      def base_url
        'http://ow.ly/api/1.1/url/shorten'
      end

      # Returns URL query parameters
      # @return [String] query parameters to be used in request
      def api_query_parameter
        "?apiKey=#{api_key}&longUrl=#{url}"
      end

      # Returns full api url
      # @return [String] full api url with query parameters
      def api_url
        base_url.concat api_query_parameter
      end
    end
  end
end
