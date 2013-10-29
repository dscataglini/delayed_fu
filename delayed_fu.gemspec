# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'delayed_fu/version'

Gem::Specification.new do |spec|
  spec.name          = "delayed_fu"
  spec.version       = DelayedFu::VERSION
  spec.authors       = ["Diego Scataglini"]
  spec.email         = ["dwebsubmit@gmail.com"]
  spec.description   = %q{adds a delayed_job compatible syntax to background_fu}
  spec.summary       = %q{adds a delayed_job compatible syntax to background_fu to models to which you include DelayedFu}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "mocha"
end
