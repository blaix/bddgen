# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bddgen/version"

Gem::Specification.new do |s|
  s.name        = "bddgen"
  s.version     = BDDGen::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Justin Blake"]
  s.email       = ["justin@hentzia.com"]
  s.homepage    = "http://rubygems.org/gems/bddgen"
  s.summary     = %q{BDD generators for new or existing ruby projects.}
  s.description = %q{Generate a new ruby project using BDD libraries like RSpec and Cucumber, or add them to existing projects.}
  s.rubyforge_project = "bddgen"
  
  s.add_dependency "thor"
  
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "aruba"
  s.add_development_dependency "yard"
  s.add_development_dependency "bluecloth"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
