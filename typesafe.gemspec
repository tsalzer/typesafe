# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{typesafe}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Till Salzer"]
  s.date = %q{2009-08-26}
  s.description = %q{Simplifies typesafe development by providing the additional
      methods Object#must_by_kind_of ad Object#must_be_a.}
  s.email = %q{till.salzer@googlemail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "features/step_definitions/typesafe_steps.rb",
     "features/support/env.rb",
     "features/typesafe.feature",
     "lib/typesafe.rb",
     "spec/spec_helper.rb",
     "spec/typesafe_class_coreclasses_spec.rb",
     "spec/typesafe_class_spec.rb",
     "spec/typesafe_spec.rb",
     "typesafe.gemspec"
  ]
  s.homepage = %q{http://github.com/tsalzer/typesafe}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{provides Object#must_be_kind_of for typesafe development}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/typesafe_class_coreclasses_spec.rb",
     "spec/typesafe_class_spec.rb",
     "spec/typesafe_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
  end
end
