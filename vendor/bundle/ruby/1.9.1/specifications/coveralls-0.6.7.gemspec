# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "coveralls"
  s.version = "0.6.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nick Merwin", "Wil Gieseler"]
  s.date = "2013-04-24"
  s.description = "A Ruby implementation of the Coveralls API."
  s.email = ["nick@lemurheavy.com", "supapuerco@gmail.com"]
  s.executables = ["coveralls"]
  s.files = ["bin/coveralls"]
  s.homepage = "https://coveralls.io"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "A Ruby implementation of the Coveralls API."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>, [">= 0"])
      s.add_runtime_dependency(%q<colorize>, [">= 0"])
      s.add_runtime_dependency(%q<multi_json>, ["~> 1.3"])
      s.add_runtime_dependency(%q<thor>, [">= 0"])
      s.add_runtime_dependency(%q<simplecov>, [">= 0.7"])
      s.add_development_dependency(%q<debugger>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<webmock>, ["= 1.7"])
      s.add_development_dependency(%q<vcr>, ["= 1.11.3"])
    else
      s.add_dependency(%q<rest-client>, [">= 0"])
      s.add_dependency(%q<colorize>, [">= 0"])
      s.add_dependency(%q<multi_json>, ["~> 1.3"])
      s.add_dependency(%q<thor>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0.7"])
      s.add_dependency(%q<debugger>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<webmock>, ["= 1.7"])
      s.add_dependency(%q<vcr>, ["= 1.11.3"])
    end
  else
    s.add_dependency(%q<rest-client>, [">= 0"])
    s.add_dependency(%q<colorize>, [">= 0"])
    s.add_dependency(%q<multi_json>, ["~> 1.3"])
    s.add_dependency(%q<thor>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0.7"])
    s.add_dependency(%q<debugger>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<webmock>, ["= 1.7"])
    s.add_dependency(%q<vcr>, ["= 1.11.3"])
  end
end
