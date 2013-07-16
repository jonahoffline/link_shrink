# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'link_shrink/version'

Gem::Specification.new do |spec|
  spec.name          = 'link_shrink'
  spec.version       = LinkShrink::VERSION
  spec.authors       = ['Jonah Ruiz']
  spec.email         = ['jonah@pixelhipsters.com']
  spec.description   = %q{Shrink those long and nasty links into a shorter URL}
  spec.summary       = %q{Shrink those long and nasty links using Google's URL Shortner API}
  spec.homepage      = 'https://github.com/jonahoffline/link_shrink'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency 'typhoeus', '~> 0.6.3'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rspec', '~> 2.14.1'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'simplecov', '~> 0.7.1'
  spec.add_development_dependency 'simplecov-gem-adapter', '~> 1.0.1'
end