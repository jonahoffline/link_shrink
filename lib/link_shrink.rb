require 'link_shrink/version'
require 'link_shrink/options'
require 'link_shrink/util'
require 'link_shrink/request'
require 'link_shrink/json_parser'
require 'link_shrink/shrinkers/base'
require 'link_shrink/shrinkers/google'
require 'link_shrink/shrinkers/tinyurl'
require 'link_shrink/shrinkers/isgd'
require 'link_shrink/shrinkers/owly'
require 'link_shrink/config'

# @author Jonah Ruiz <jonah@pixelhipsters.com>
# Creates a short URL and QR codes
module LinkShrink
  extend self
  include LinkShrink::Request
  # Returns a short URL or JSON response
  #   example: shrink_url('http://www.wtf.com', { json: true, qr_code: true })
  #   example: shrink_url('http://www.wtf.com', { qr_code: true })
  #
  # @param url [String] long URL to be shortened
  # @param options [Hash] format to be returned
  # @return [String] generated short URL or JSON response
  def shrink_url(url, options = { json: false, qr_code: false })
    process_request(url, options)
  end

  # Returns a QR code URL
  #   example: generate_qr_code('http://www.wtf.com', { image_size: '300x300' })
  #
  # @param url [String] long URL to be shortened
  # @param options [Hash] image_size: '300x300' for a custom size
  # @return [String] QR code URL using default or custom size
  def generate_qr_code(url, options = {})
    new_url    = process_request(url, {})
    image_size = options.fetch(:image_size, {})
    Config.api.generate_chart_url(new_url, image_size)
  end

  # Yield's to Config for options
  #
  # @param <config> [String] api interface to use
  # @param <api_key> [String] api key to use
  def configure
    yield LinkShrink::Config if block_given?
  end
end
