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
# Creates a short URLs
module LinkShrink
  extend self
  include LinkShrink::Request
  # Returns a short URL
  #   example: shrink_url('http://www.wtf.com')
  #
  # @param url [String] long URL to be shortened
  # @return [String] generated short URL
  def shrink_url(url)
    process_request(url)
  end

  # Yield's to Config for options
  #
  # @param <config> [String] api interface to use
  # @param <api_key> [String] api key to use
  def configure
    yield LinkShrink::Config if block_given?
  end
end
