module LinkShrink
  module Shrinkers
    # @author Jonah Ruiz <jonah@pixelhipsters.com>
    # Implements Karmacracy's URL Shortener API
    class Karmacracy < Base
      # Defines response structure to be parsed
      response_options do
        collection 'data'
        short_url  'url'
      end

      # Returns URL base for API
      # @return [String] api base url
      def base_url
        'http://kcy.me/api/'
      end

      # Returns URL query parameters
      # @return [String] query parameters to be used in request
      def api_query_parameter
        "?u=#{api_username}&key=#{api_key}&format=json&url=#{url}"
      end

      # Returns full api url
      # @return [String] full api url with query parameters
      def api_url
        base_url.concat api_query_parameter
      end

      # Predicate method for checking if the API key exists
      # @return [TrueClass, FalseClass]
      def api_username?
        ENV.has_key?("#{sub_klass.upcase}_USERNAME")
      end

      # Returns API Key
      # @return [String] API key or nil
      def api_username
        api_username? ? ENV["#{sub_klass.upcase}_USERNAME"] : nil
      end

      def sanitize_url(new_url)
        URI::encode(new_url)
      end
    end
  end
end
