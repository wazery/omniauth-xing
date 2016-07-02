lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-xing/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-xing"
  spec.version       = Omniauth::Xing::VERSION
  spec.authors       = ["Islam Wazery"]
  spec.email         = ["wazery@ubuntu.com"]
  spec.summary       = %q{OmniAuth strategy for Xing}
  spec.description   = %q{OmniAuth strategy for Xing}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth", "~> 1.0"
  spec.add_dependency "omniauth-oauth", "~> 1.0"
  spec.add_dependency("multi_json")

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.7"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "webmock"
end
