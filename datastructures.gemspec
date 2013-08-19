# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require File.expand_path('../lib/datastructures/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'datastructures'
  gem.authors       = [ "Richard Smith" ]
  gem.email         = "rds45@cam.ac.uk"
  gem.homepage      = 'https://github.com/Blahah/datastructures'
  gem.summary       = %q{ 42 useful data structures }
  gem.description   = %q{ 42 useful data structures implemented in pure Ruby for my data structures challenge. }
  gem.version       = DataStructures::VERSION::STRING.dup

  gem.files = Dir['Rakefile', '{lib,test}/**/*', 'README*', 'LICENSE*']
  gem.require_paths = %w[ lib ]

  gem.add_dependency 'rake'

  gem.add_development_dependency 'simplecov', '~> 1.7.1'
  gem.add_development_dependency 'shoulda', '~> 3.5.0'
  gem.add_development_dependency 'coveralls', '~> 0.6.7'
end