# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "saucelabs"
  spec.version       = "0.3"
  spec.authors       = ["Pradeep K. Macharla"]
  spec.email         = ["pradeep@seleniumframework.com"]
  spec.summary       = %q{Access saucelabs using simple ruby.}
  spec.description   = %q{Access saucelabs by passing browser, version, platform and device information}
  spec.homepage      = "https://github.com/machzqcq/saucelabs"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'watir-webdriver', '>= 0.6.9'
  spec.add_dependency 'selenium-webdriver'
  spec.add_dependency 'net-http-persistent'
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end