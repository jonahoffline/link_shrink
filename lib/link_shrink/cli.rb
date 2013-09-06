require 'optparse'

module LinkShrink
  # @author Jonah Ruiz <jonah@pixelhipsters.com>
  # A Simple class for the executable version of the gem
  class CLI

    # @param args [Array<String>] The command-line arguments
    def initialize(args)
      @args = args
    end

    # Configures the arguments for the command
    # @param opts [OptionParser]
    def set_options(opts)
      %w(@json @qr_code @tiny_url)
      @json        = false
      @qr_code     = false
      @tiny_url    = false
      @google      = false
      opts.version = LinkShrink::VERSION
      opts.banner  = <<MSG
Usage: link_shrink [OPTION] [URL]
Description:
  LinkShrink, Turn long and nasty links into short urls.

Options:
MSG
      opts.set_program_name 'LinkShrink'
      opts.on_head('-t', '--tinyurl', 'use TinyURL') do
        @tiny_url = :true
      end

      opts.on_head('-g', '--google', 'use Google (Default)') do
        @google = :true
      end

      opts.on_head('-j', '--json', 'return JSON response') do
        @json = :true
      end

      opts.on_head('-q', '--qrcode', 'return QR Code') do
        @qr_code = :true unless @tiny_url
      end

      opts.on_tail('-v', '--version', 'display the version of LinkShrink and exit') do
        puts opts.version
        exit
      end

      opts.on_tail('-h', '--help', 'print this help') do
        puts opts.help
        exit
      end
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
      LinkShrink.configure { |c| c.api = 'TinyUrl' } if @tiny_url
      LinkShrink.shrink_url(@args.last, { json: @json, qr_code: @qr_code })
    end

    def url_present?
      !!(@args.last =~ /^(http?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/)
    end
  end
end
