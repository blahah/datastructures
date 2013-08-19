# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "shoulda"
  s.version = "3.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tammer Saleh", "Joe Ferris", "Ryan McGeary", "Dan Croak", "Matt Jankowski"]
  s.date = "2013-05-07"
  s.description = "Making tests easy on the fingers and eyes"
  s.email = "support@thoughtbot.com"
  s.homepage = "https://github.com/thoughtbot/shoulda"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Making tests easy on the fingers and eyes"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<shoulda-context>, [">= 1.0.1", "~> 1.0"])
      s.add_runtime_dependency(%q<shoulda-matchers>, ["< 3.0", ">= 1.4.1"])
      s.add_development_dependency(%q<appraisal>, ["~> 0.4.0"])
      s.add_development_dependency(%q<rails>, ["= 3.0.12"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3.2"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 2.7.0"])
      s.add_development_dependency(%q<cucumber>, ["~> 1.1.0"])
      s.add_development_dependency(%q<aruba>, ["~> 0.4.11"])
    else
      s.add_dependency(%q<shoulda-context>, [">= 1.0.1", "~> 1.0"])
      s.add_dependency(%q<shoulda-matchers>, ["< 3.0", ">= 1.4.1"])
      s.add_dependency(%q<appraisal>, ["~> 0.4.0"])
      s.add_dependency(%q<rails>, ["= 3.0.12"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3.2"])
      s.add_dependency(%q<rspec-rails>, ["~> 2.7.0"])
      s.add_dependency(%q<cucumber>, ["~> 1.1.0"])
      s.add_dependency(%q<aruba>, ["~> 0.4.11"])
    end
  else
    s.add_dependency(%q<shoulda-context>, [">= 1.0.1", "~> 1.0"])
    s.add_dependency(%q<shoulda-matchers>, ["< 3.0", ">= 1.4.1"])
    s.add_dependency(%q<appraisal>, ["~> 0.4.0"])
    s.add_dependency(%q<rails>, ["= 3.0.12"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3.2"])
    s.add_dependency(%q<rspec-rails>, ["~> 2.7.0"])
    s.add_dependency(%q<cucumber>, ["~> 1.1.0"])
    s.add_dependency(%q<aruba>, ["~> 0.4.11"])
  end
end
