# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/streamlabs/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-streamlabs"
  spec.version       = OmniAuth::Streamlabs::VERSION
  spec.authors       = ["Matt Rohrer"]
  spec.email         = ["matt@prognostikos.com"]

  spec.summary       = %q{Streamlabs OAuth2 strategy for OmniAuth}
  spec.homepage      = "https://github.com/prognostikos/omniauth-streamlabs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
