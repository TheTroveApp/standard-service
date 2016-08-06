# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'standard_service/version'

Gem::Specification.new do |spec|
  spec.name          = "standard_service"
  spec.version       = StandardService::VERSION
  spec.authors       = ["Ersin Akinci"]
  spec.email         = ["ersin@thetroveapp.com"]

  spec.summary       = %q{A library for creating standardized services}
  spec.homepage      = "https://github.com/TheTroveApp/standard-service"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
