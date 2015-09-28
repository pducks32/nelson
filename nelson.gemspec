# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nelson/version'

Gem::Specification.new do |spec|
  spec.name          = "nelson"
  spec.version       = Nelson::VERSION
  spec.authors       = ["Patrick Metcalfe"]
  spec.email         = ["git@patrickmetcalfe.com"]

  spec.summary       = %q{A library for building math expressions fluently.}
  spec.description   = %q{This library provides a flient API to write math expressions that can be manipulated and solved programmatically.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
