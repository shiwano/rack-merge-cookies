# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/merge-cookies/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-merge-cookies'
  spec.version       = Rack::MergeCookies::VERSION
  spec.authors       = ['Shogo Iwano']
  spec.email         = ['shiwano@gmail.com']
  spec.summary       = 'Rack middleware to merge the user-defined header to cookies.'
  spec.description   = 'Rack middleware to merge the user-defined header to cookies.'
  spec.homepage      = 'http://github.com/shiwano/rack-merge-cookies'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',   '~> 1.0'
  spec.add_development_dependency 'rack',      '~> 1.2'
  spec.add_development_dependency 'rack-test', '~> 0.6.2'
end
