module LinkShrink
  module Shrinkers
    # @author Jonah Ruiz <jonah@pixelhipsters.com>
    # Implements Tiny URL Shortener API
    class TinyUrl < Base
      def base_url
        'http://tinyurl.com/api-create.php'
      end

      def api_query_parameter
        "?url=#{url}"
      end

      def content_type
        'text/plain'
      end

      def api_url
        base_url.concat api_query_parameter
      end
    end
  end
end