LinkShrink [![Build Status](https://travis-ci.org/jonahoffline/link_shrink.png?branch=master)](https://travis-ci.org/jonahoffline/link_shrink) [![Gem Version](https://badge.fury.io/rb/link_shrink.png)](http://badge.fury.io/rb/link_shrink) [![Dependency Status](https://gemnasium.com/jonahoffline/link_shrink.png)](https://gemnasium.com/jonahoffline/link_shrink)
=================

A Ruby Gem and Command-Line Application for shrinking those long and nasty links into a shorter URL

Installation
---------------------

    $ gem install link_shrink

## Usage ##

Ruby:

```ruby
require 'link_shrink'

LinkShrink.shrink_url("http://www.ruby-lang.org")
=> "http://goo.gl/QuXj"

LinkShrink.shrink_url("http://www.ruby-lang.org", { :json => true })
=> "{\"kind\":\"urlshortener#url\",\"id\":\"http://goo.gl/MprR\",\"longUrl\":\"http://www.ruby-lang.org/\"}"
```


In your terminal:

    $ linkshrink http://www.rubyrogues.com
    http://goo.gl/Noh9X

### Command-Line Options ###

  * -j, --json        - return JSON response
  * -h, --help        - show help message

## Author
  * [Jonah Ruiz](http://www.pixelhipsters.com)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request