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

      def body_parameters(url)
        { 'longUrl' => sanitize_url(url) }.to_json
      end

      # Generates QR code URL
      # @return [String] QR code url with '150x150' or custom image size
      def generate_chart_url(url, image_size = {})
        return "#{url}.qr" if image_size.empty?

        chart_url = 'http://chart.googleapis.com/chart'
        params    = "?cht=qr&chs=#{image_size}&choe=UTF-8&chld=H&chl=#{url}"
        chart_url.concat(params)
      end
    end
  end
end