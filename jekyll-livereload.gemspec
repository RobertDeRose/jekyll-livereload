# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-livereload/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = '>= 2.0.0'

  spec.name          = "jekyll-livereload"
  spec.version       = Jekyll::Livereload::VERSION
  spec.license       = "MIT"

  spec.summary       = "Adds LiveReload support to Jekyll's included Server"
  spec.description   = <<-EOF
    This is a plugin for Jekyll. It adds additional command line options to
    the server command to provide Livereloading capabilities.
  EOF

  spec.authors       = ["Robert DeRose"]
  spec.email         = ["RobertDeRose@gmail.com"]
  spec.homepage      = 'https://github.com/RobertDeRose/jekyll-livereload'

  spec.files         = `git ls-files -z`.split("\x0").grep(%r{(bin|lib|js)/})
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jekyll", "~> 3.0"
  spec.add_runtime_dependency "em-websocket", "~> 0.5"

  spec.add_development_dependency "bundler", "~> 1.12"
end
