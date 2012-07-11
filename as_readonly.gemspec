# -*- encoding: utf-8 -*-
require File.expand_path('../lib/as_readonly/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Robert Pankowecki"]
  gem.email         = ["robert.pankowecki@gmail.com"]
  gem.description   = %q{Safely expose collections as readonly objects}
  gem.summary       = %q{Safley expose collections}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "as_readonly"
  gem.require_paths = ["lib"]
  gem.version       = AsReadonly::VERSION
end
