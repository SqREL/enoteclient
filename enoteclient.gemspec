# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enoteclient/version'

Gem::Specification.new do |gem|
  gem.name          = "enoteclient"
  gem.version       = EnoteClient::VERSION
  gem.authors       = ["Vasilij Melnychuck"]
  gem.email         = ["isqrel@gmail.com"]
  gem.description   = %q{Enote client}
  gem.summary       = %q{Client for service, that provides managing your notes}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'rake'
  gem.add_dependency 'json'
  gem.add_dependency 'activeresource'

  ['rspec'].each do |dep|
    gem.add_development_dependency(dep)
  end
end
