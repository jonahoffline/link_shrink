# LinkShrink Changelog

## 0.0.3

Released September 6, 2013 ([0.0.3](https://github.com/jonahoffline/link_shrink/tree/v0.0.3)).

* Add Config class for configuring Shrinker API to use.
* Add TinyURL Shrinker.
* Add documentation to TinyUrl, Google and Base class.
* Add new options for command-line application.
* Update README.
* Refactor Shrinker Base class and the Google class.
* Added 2.0 and JRuby support through TravisCI.

## 0.0.2

Released July 16, 2013 ([0.0.2](https://github.com/jonahoffline/link_shrink/tree/v0.0.2)).

* Add :qr_code, and :image_size options to the shrink_url.
* Add new generate_qr_code method to LinkShrink.
* Add method for using API key.
* Refactor LinkShrink module.
* Move code from LinkShrink into new Request module.
* Move json-related code into new JSONParser module.
* Add new Options class.
* Add Shrinker::Base abstract class for defining other URL APIs.
* Move Google URL API related code into its own class implemeting new Base class.
* Add --qrcode option into CLI for command-line application.
* Update README.
* Add Changelog.
* Update gemspec development-dependencies (RSpec)
* Add new gemspec development-dependencies (autotest-test, rspec-nc, simplecov)
* Add BadgeFury, Gemnasium, CodeClimate and Travis-CI badges to README.

## 0.0.1

Released June 24, 2013 ([0.0.1](https://github.com/jonahoffline/link_shrink/tree/v0.0.1)).

* Initial Release.