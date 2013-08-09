module LinkShrink
  module Shrinkers
    # @author Jonah Ruiz <jonah@pixelhipsters.com>
    # Implements Tiny URL Shortener API
    class TinyUrl < Base
      def base_url
        'http://tinyurl.com/api-create.php'
      end

      def api_query_parameter
        { url: sanitize_url(url) }
      end

      def http_method
        :get
      end

      def content_type
        'text/plain'
      end

      def body_parameters
        nil
      end
    end
  end
end