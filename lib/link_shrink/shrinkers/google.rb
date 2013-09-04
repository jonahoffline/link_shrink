require 'json'

module LinkShrink
  module Shrinkers
    # @author Jonah Ruiz <jonah@pixelhipsters.com>
    # Implements Google's URL Shortener API
    class Google < Base
      def base_url
        'https://www.googleapis.com/urlshortener/v1/url'
      end

      def api_query_parameter
        "?key=#{api_key}"
      end

      def body_parameters(new_url = nil)
        { 'longUrl' => url }.to_json
      end

      # Generates QR code URL
      # @return [String] QR code url with '150x150' or custom image size
      def generate_chart_url(new_url, image_size = {})
        return "#{new_url}.qr" if image_size.empty?

        chart_url = 'http://chart.googleapis.com/chart'
        params    = "?cht=qr&chs=#{image_size}&choe=UTF-8&chld=H&chl=#{new_url}"
        chart_url.concat(params)
      end

      def http_method
        :post
      end
    end
  end
end
