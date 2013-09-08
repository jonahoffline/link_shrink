# LinkShrink 
[![Build Status](https://travis-ci.org/jonahoffline/link_shrink.png?branch=master)](https://travis-ci.org/jonahoffline/link_shrink) [![Gem Version](https://badge.fury.io/rb/link_shrink.png)](http://badge.fury.io/rb/link_shrink) [![Dependency Status](https://gemnasium.com/jonahoffline/link_shrink.png)](https://gemnasium.com/jonahoffline/link_shrink) [![Coverage Status](https://coveralls.io/repos/jonahoffline/link_shrink/badge.png?branch=master)](https://coveralls.io/r/jonahoffline/link_shrink?branch=master) [![Code Climate](https://codeclimate.com/github/jonahoffline/link_shrink.png)](https://codeclimate.com/github/jonahoffline/link_shrink)

A Ruby Gem and Command-Line Application for shrinking those long and nasty links into a shorter URL

## Supported Url Shortener APIs

* Google
* TinyUrl
* IsGd
* Owly
* **More to come...**

Installation
---------------------

    $ gem install link_shrink


Setup
-------

## Google
Works best with a Google URL API key. You can sign-up for a free one at
[Google URL API](https://code.google.com/apis/console)

1. In the Services pane, activate the Google URL Shortener API;
if the Terms of Service appear, read and accept them.

2. Go to the [API Access pane](https://code.google.com/apis/console#access). The API key is near the bottom of that pane,
in the section titled "Simple API Access."

## Owly
Sign-up for a free API key at [Owly](http://ow.ly/).


#### Configuration

Set your apikey as an environment variable:

    $ export GOOGLE_URL_KEY='your_api_key_here'
   
    
    $ export OWLY_URL_KEY='your_api_key_here'

You could also save it in your ~/.bash_profile


## Usage ##

Ruby:

```ruby
require 'link_shrink'

LinkShrink.shrink_url("http://www.ruby-lang.org")
=> "http://goo.gl/QuXj"

LinkShrink.shrink_url("http://www.ruby-lang.org", { :json => true })
=> "{\"kind\":\"urlshortener#url\",\"id\":\"http://goo.gl/MprR\",\"longUrl\":\"http://www.ruby-lang.org/\"}"

LinkShrink.shrink_url("http://www.ruby-lang.org", { :qr_code => true })
=> "http://goo.gl/QuXj.qr"

LinkShrink.shrink_url("http://www.ruby-lang.org", { :qr_code => true, image_size: '200x200' })
=> "http://chart.googleapis.com/chart?cht=qr&chs=200x200&choe=UTF-8&chld=H&chl=http://goo.gl/MprR"

LinkShrink.shrink_url("http://www.ruby-lang.org", { json: true, qr_code: true, image_size: '300x300' })
=> "{\"kind\":\"urlshortener#url\",\"id\":\"http://goo.gl/MprR\",\"longUrl\":\"http://www.ruby-lang.org/\",\"qr_code\":\"http://chart.googleapis.com/chart?cht=qr&chs=300x300&choe=UTF-8&chld=H&chl=http://goo.gl/MprR\"}"

```

To change the default shrinker (Google API):


```ruby
LinkShrink.configure do |c|
  c.api = 'TinyUrl'
end

# or

LinkShrink::Config.api = 'IsGd'

LinkShrink.shrink_url('http://www.google.com')
=> "http://tinyurl.com/1c2"

```


In your terminal:

    $ linkshrink http://www.rubyrogues.com
    http://goo.gl/Noh9X
    
    $ linkshrink --tinyurl http://www.rubyrogues.com
    http://tinyurl.com/k2butj9

    $ linkshrink --isgd http://www.rubyrogues.com
    http://is.gd/6ZNRWe
    
    $ linkshrink --owly http://www.rubyrogues.com
    http://ow.ly/22rwSe
    
### Command-Line Options ###

Shrinkers:

  * -t, --tinyurl     - use TinyUrl API
  * -i, --isgd		   - use Is.gd API
  * -om --owly        - use Owly API
  * -g, --google      - use Google API (Default) 

Format and additional options:

  * -j, --json        - return JSON response
  * -q, --qrcode      - return QR Code
  * -h, --help        - show help message

## Author
  * [Jonah Ruiz](http://www.pixelhipsters.com)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request