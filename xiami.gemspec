# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xiami/version'

Gem::Specification.new do |spec|
  spec.name          = "xiami"
  spec.version       = Xiami::VERSION
  spec.authors       = ["Forrest Ye"]
  spec.email         = ["afu@forresty.com"]
  spec.summary       = %q{ retrieve songs from http://xiami.com }
  spec.homepage      = "https://github.com/forresty/xiami"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency 'nokogiri'
  spec.add_runtime_dependency 'fastimage'
  spec.add_runtime_dependency 'httpi'
  spec.add_runtime_dependency 'curb'
  spec.add_runtime_dependency 'virtus'
  spec.add_runtime_dependency 'inflecto'
end
