module LinkShrink
  module Shrinkers
    # @author Jonah Ruiz <jonah@pixelhipsters.com>
    # Implements Is.gd Shortener API
    class IsGd < Base
      # Returns URL base for API
      # @return [String] api base url
      def base_url
        'http://is.gd/create.php'
      end

      # URL query parameters
      # @return [String] query parameters to be used in request
      def api_query_parameter
        "?format=simple&url=#{url}"
      end

      # Returns Content-Type to be used in Request headers
      # @return [String] text/plain as content-type
      def content_type
        'text/plain'
      end

      # Returns full api url
      # @return [String] full api url with query parameters
      def api_url
        base_url.concat api_query_parameter
      end
    end
  end
end