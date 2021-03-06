# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'r_calendar/version'

Gem::Specification.new do |spec|
  spec.name          = "r_calendar"
  spec.version       = RCalendar::VERSION
  spec.authors       = ["Kenji Ohtsuka"]
  spec.email         = ["kok.fdcm@gmail.com"]
  #spec.description   = %q{s}
  spec.summary       = %q{script to generate calendar array}
  spec.homepage      = ""
  spec.license       = "GPL-3.0"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
