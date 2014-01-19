# LinkShrink Changelog

## 0.0.8

Released January 19, 2014 ([0.0.7](https://github.com/jonahoffline/link_shrink/tree/v0.0.8)).

* Add Karmacracy Shrinker (available automatically in the command-line)
* Update version to 0.0.8

## 0.0.7

Released January 19, 2014 ([0.0.7](https://github.com/jonahoffline/link_shrink/tree/v0.0.7)).

* Remove old features documentation and examples from README
* Refactor LinkShrink, Request modules
* Refactor LinkShrink::CLI class and update documentation
* Remove json and qr_code options from CLI class
* Remove charts, qr_codes and json options tests
* Add error parameter to :response_options block in Owly Shrinker
* Fix indentation in Owly spec
* Add error_key and error for internal DSL in Shrinkers::Base
* Remove rescue method from :shrink_url
* Add Util module for helper methods
* Update documentation for ::Shrinkers::Base class
* Update documentation in Config module
* Move shrinkers specs into its own shrinkers folder to mirror lib structure
* Add a Bitdeli badge to README
* Update development dependencies for `webmock`, `vcr` and `simplecov`
* Update version to 0.0.7

## 0.0.6

Released September 8, 2013 ([0.0.6](https://github.com/jonahoffline/link_shrink/tree/v0.0.6)).

* Add Owly Shrinker
* Add option for selecting Owly Shrinker in command-line application.
* Add new mini DSL to ::Shrinkers::Base for defining the response structure to be parsed.
* Update Google class to use the response_options configuration.
* Update README with a new options and configuration.
* Update version to 0.0.6

## 0.0.5

Released September 7, 2013 ([0.0.5](https://github.com/jonahoffline/link_shrink/tree/v0.0.5)).

* Add Is.gd Shrinker
* Add option for selecting Is.gd Shrinker in command-line application.
* Update version to 0.0.5

## 0.0.4

Released September 6, 2013 ([0.0.4](https://github.com/jonahoffline/link_shrink/tree/v0.0.4)).

* Refactor complex method in Request module (#process_response).
* Update version to 0.0.4
* Add coveralls badge.

## 0.0.3

Released September 6, 2013 ([0.0.3](https://github.com/jonahoffline/link_shrink/tree/v0.0.3)).

* Add Coverall gem to gemspec.
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
