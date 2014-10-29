# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'meetup_winner/version'

Gem::Specification.new do |spec|
  spec.name          = "meetup_winner"
  spec.version       = MeetupWinner::VERSION
  spec.authors       = ["Jean Pierre Guarin"]
  spec.email         = ["escribimepues@gmail.com"]
  spec.summary       = %q{Choose a lucky winner from a meetup event}
  spec.description   = %q{Choose a lucky winner from an meetup event attendance list}
  spec.homepage      = "https://github.com/gomayonqui/meetup_winner"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty", "~> 0.13"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
