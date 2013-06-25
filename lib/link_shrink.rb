require 'link_shrink/version'
require 'typhoeus'
require 'json'
require 'uri'

  # @author Jonah Ruiz <jonah@pixelhipsters.com>
  # Creates a short URL using Google's URL Shortener API
module LinkShrink

  # Returns a short URL or JSON response
  #
  # @param url [String] long URL to be shortened
  # @param options [Hash] format to be returned
  # @return [String] generated short URL or JSON response
  def self.shrink_url(url, options = {:json => false})
    res = request(URI.encode(url))
    options.fetch(:json, nil) ? cleanup_json(res.body) : parse_json(res.body)['id']
  rescue
    'Problem generating short URL. Try again.'
  end

  private

  def self.request(url)
    Typhoeus::Request.new(
      'https://www.googleapis.com/urlshortener/v1/url',
      method:  :post,
      body:    { 'longUrl' => url }.to_json,
      headers: { 'Content-Type' => 'application/json' }
    ).run
  end

  def self.parse_json(data)
    JSON.parse(data)
  end

  def self.cleanup_json(data)
    data.gsub(/\s+/, '')
  end
end