require 'optparse'
require 'ostruct'

module LinkShrink
  # @author Jonah Ruiz <jonah@pixelhipsters.com>
  # A Simple class for the executable version of the gem
  class CLI
    include LinkShrink::Util

    # @!attribute [r] options
    # @return [String] options for api settings
    attr_reader :options
    # @param args [Array<String>] The command-line arguments
    def initialize(args)
      @args, @options = args, OpenStruct.new(default_options)
    end

    def banner
      <<MSG
Usage: link_shrink [OPTION] [URL]
Description:
  LinkShrink, Turn long and nasty links into short urls.

Options:
MSG
    end

    def default_options
      apis = (available_shrinkers).reduce({}) do |opts, key|
        opts[key] = false
        opts
      end

      {}.merge({
        api: apis.merge(Google: true),
        banner: banner,
        version: LinkShrink::VERSION,
        json: false,
        qr_code: false
      })
    end

    # Configures the arguments for the command
    # @param opts [OptionParser]
    def set_options(opts)
      opts.version, opts.banner = options.version, options.banner
      opts.set_program_name 'LinkShrink'

      options.api.map do |k, v|
        arg = k.to_s.downcase

        opts.on_head("-#{arg[0]}", "--#{arg}", argument_text_for(k)) do
          options.api[k] = true
        end
      end

      opts.on_head('-j', '--json', 'return JSON response') do
        options.json = true
      end

      opts.on_head('-q', '--qrcode', 'return QR Code') do
        options.qr_code = :true if options.google
      end

      opts.on_tail('-v', '--version',
                   'display the version of LinkShrink and exit') do
        puts opts.ver
        exit
      end

      opts.on_tail('-h', '--help', 'print this help') do
        puts opts.help
        exit
      end
    end

    def argument_text_for(option)
      "use #{option}".concat option.eql?(:Google) ? ' (Default)' : ''
    end

    # Parses the command-line arguments and runs the executable
    # @return [String] The short url or argument passed
    def parse
      opts = OptionParser.new(&method(:set_options))
      opts.parse!(@args)
      return process_url if url_present?
      opts.help
    end

    def process_url
      LinkShrink.configure { |config| config.api = select_api }

      LinkShrink.shrink_url(@args.last,
        { json: options.json, qr_code: options.qr_code })
    end

    def url_present?
      regexp = /^(http?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/
      !!(@args.last =~ regexp)
    end

    def select_api
      options.api.select { |_, v| v }.keys.last.to_s
    end
  end
end
