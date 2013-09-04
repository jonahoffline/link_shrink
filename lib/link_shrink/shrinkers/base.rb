require 'uri'

module LinkShrink
  module Shrinkers
    # @author Jonah Ruiz <jonah@pixelhipsters.com>
    # an Abstract Base class for implementing other URL APIs
    class Base
      attr_reader :url
      # Callback method that dynamically defines a sub_klass method for reference
      # @return [String] inherited class name
      def self.inherited(sub_klass)
        define_method 'sub_klass' do
          "#{sub_klass.name}"[/::(\w+)::(\w+)/, 2]
        end
      end

      # URL base for API
      def base_url
        fail "#{__method__} not implemented"
      end

      # URL query parameters
      def api_query_parameter
        fail "#{__method__} not implemented"
      end

      # Parameters to be used in API request
      def body_parameters(params = {})
        nil if params.empty?
      end

      # Complete URL with query parameters
      def api_url
        api_key? ? base_url.concat(api_query_parameter) : base_url
        #api_key? ? base_url : base_url.concat(api_query_parameter)
        #base_url.concat(api_query_parameter)
      end

      # Predicate method for checking if the API key exists
      # @return [TrueClass, FalseClass]
      def api_key?
        ENV.has_key?("#{sub_klass.upcase}_URL_KEY")
      end

      # Returns API Key
      # @return [String] API key or nil
      def api_key
        api_key? ? ENV["#{sub_klass.upcase}_URL_KEY"] : nil
      end

      # Encodes URL
      def sanitize_url(new_url)
        URI.encode(!!(new_url =~ /^(http?:\/\/)?/) ? new_url : "http://#{new_url}")
      end

      def http_method
        :get
      end

      def content_type
        'application/json'
      end

      def url=(new_url)
        @url = sanitize_url(new_url)
      end
    end
  end
end
