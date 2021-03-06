# LinkShrink 
[![Build Status](https://travis-ci.org/jonahoffline/link_shrink.png?branch=master)](https://travis-ci.org/jonahoffline/link_shrink) [![Gem Version](https://badge.fury.io/rb/link_shrink.png)](http://badge.fury.io/rb/link_shrink) [![Dependency Status](https://gemnasium.com/jonahoffline/link_shrink.png)](https://gemnasium.com/jonahoffline/link_shrink) [![Coverage Status](https://coveralls.io/repos/jonahoffline/link_shrink/badge.png?branch=master)](https://coveralls.io/r/jonahoffline/link_shrink?branch=master) [![Code Climate](https://codeclimate.com/github/jonahoffline/link_shrink.png)](https://codeclimate.com/github/jonahoffline/link_shrink) [![Inline docs](http://inch-ci.org/github/jonahoffline/link_shrink.png)](http://inch-ci.org/github/jonahoffline/link_shrink)
[![Gitter chat](https://badges.gitter.im/jonahoffline/link_shrink.png)](https://gitter.im/jonahoffline/link_shrink)

A Ruby Gem and Command-Line Application for shrinking those long and nasty links into a shorter URL

## Supported Url Shortener APIs

* Google
* TinyUrl
* IsGd
* Owly
* Karmacracy
* **More to come...**

## Installation


    $ gem install link_shrink


## Setup

You can use any shrinker listed without worrying about the api key except for **Owly** and **Karmacracy**. Google let's you use its api without an api key, but providing one will generate metrics in their dashboard.

## Google
Works best with a Google URL API key. You can sign-up for a free one at
[Google URL API](https://code.google.com/apis/console)

1. In the Services pane, activate the Google URL Shortener API;
if the Terms of Service appear, read and accept them.

2. Go to the [API Access pane](https://code.google.com/apis/console#access). The API key is near the bottom of that pane,
in the section titled "Simple API Access."

## Owly
Sign-up for a free API key at [Owly](http://ow.ly/).

## Karmacracy
Sign-up for a free API key at [Karmacracy](http://karmacracy.com/).

#### Configuration

Set your apikey as an environment variable:

    $ export GOOGLE_URL_KEY='your_api_key_here'
    
    $ export OWLY_URL_KEY='your_api_key_here'
    
    $ export KARMACRACY_URL_KEY='your_api_key_here'
    $ export KARMACRACY_USERNAME='your_username_here'

You could also save it in your `~/.bash_profile` or `~/.zshrc`


## Usage

Ruby:

```ruby
require 'link_shrink'

LinkShrink.shrink_url("http://www.ruby-lang.org")
=> "http://goo.gl/QuXj"

```

To change the default shrinker (Google API):


```ruby
LinkShrink.configure do |c|
  c.api = 'IsGd'
end

# or

LinkShrink::Config.api = 'TinyUrl'

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
    
### Command-Line Options

Shrinkers:

  * -t, --tinyurl     - use TinyUrl API
  * -i, --isgd		   - use Is.gd API
  * -om --owly        - use Owly API
  * -g, --google      - use Google API (Default)
  * -k  --karmacracy  - use Karmacracy API

Additional options:

  * -h, --help        - show help message

## Todo
 * Batch list (with selected api or specified for operation)
 * Save to file (html, text)
 * Bitly Shrinker API
 * Parallel HTTP Requests

## Author
  * [Jonah Ruiz](http://www.pixelhipsters.com)

## Discussion
If you have any questions, ideas or jokes:

[![Gitter chat](https://badges.gitter.im/jonahoffline/link_shrink.png)](https://gitter.im/jonahoffline/link_shrink)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/jonahoffline/link_shrink/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

