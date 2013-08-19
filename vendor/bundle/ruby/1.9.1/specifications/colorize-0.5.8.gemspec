# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "colorize"
  s.version = "0.5.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["fazibear"]
  s.date = "2009-12-01"
  s.description = "Ruby string class extension. It add some methods to set color, background color and text effect on console easier. Uses ANSI escape sequences."
  s.email = "fazibear@gmail.com"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://github.com/fazibear/colorize"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Add colors methods to string class"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
