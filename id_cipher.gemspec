# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'id_cipher/version'

Gem::Specification.new do |spec|
  spec.name          = "id_cipher"
  spec.version       = IdCipher::VERSION
  spec.authors       = ["delong"]
  spec.email         = ["w.del@qq.com"]
  spec.summary       = %q{cipher integer to another integer}
  spec.description   = %q{only used to cipher integer, use in confused with ID}
  spec.homepage      = "https://github.com/delongw/ruby-id-cipher"
  spec.required_ruby_version = '>= 2.0'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
