# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-livereload/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-livereload"
  spec.version       = Jekyll::Livereload::VERSION
  spec.authors       = ["Robert DeRose"]
  spec.email         = ["RobertDeRose@gmail.com"]
  spec.summary       = "Adds LiveReload support to Jekyll's included Server"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.homepage      = 'https://github.com/RobertDeRose/jekyll-livereload'
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jekyll", "~> 3.0"
  spec.add_runtime_dependency "em-websocket", "~> 0.5"

  spec.add_development_dependency "bundler", "~> 1.12"
end
