# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'volt/redis_message_bus/version'

Gem::Specification.new do |spec|
  spec.name          = "volt-redis_message_bus"
  spec.version       = Volt::RedisMessageBus::VERSION
  spec.authors       = ["Ryan Stout"]
  spec.email         = ["ryanstout@gmail.com"]
  spec.summary       = %q{A message bus strategy for Volt using redis}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'redis', '~> 3.2.1'

  spec.add_development_dependency "volt", "~> 0.9.6"
  spec.add_development_dependency "rake"

  # Testing gems
  spec.add_development_dependency 'rspec', '~> 3.2.0'
  spec.add_development_dependency 'opal-rspec', '~> 0.4.2'
  spec.add_development_dependency 'capybara', '~> 2.4.4'
  spec.add_development_dependency 'selenium-webdriver', '~> 2.47.0'
  spec.add_development_dependency 'chromedriver-helper', '~> 1.0.0'
  spec.add_development_dependency 'poltergeist', '~> 1.6.0'

  # Gems to run the dummy app
  spec.add_development_dependency 'volt-mongo', '0.1.1'
  spec.add_development_dependency 'volt-bootstrap', '~> 0.1.0'
  spec.add_development_dependency 'volt-bootstrap_jumbotron_theme', '~> 0.1.0'
  spec.add_development_dependency 'volt-user_templates', '~> 0.4.0'
  spec.add_development_dependency 'thin', '~> 1.6.0'

end
