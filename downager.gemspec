# -*- encoding: utf-8 -*-

require File.expand_path('../lib/downager/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "downager"
  gem.version       = Downager::VERSION
  gem.summary       = %q{TODO: Summary}
  gem.description   = %q{TODO: Description}
  gem.license       = "MIT"
  gem.authors       = ["Martin Feckie"]
  gem.email         = "mfeckie@gmail.com"
  gem.homepage      = "https://rubygems.org/gems/downager"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rubygems-tasks'
  gem.add_development_dependency 'guard-rspec'
end
