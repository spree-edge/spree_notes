# encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_notes/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_notes'
  s.version     = SpreeNotes.version
  s.summary     = 'Spree Notes'
  s.description = 'A spree_extension that provides ability to add notes'
  s.required_ruby_version = '>= 2.5'

  s.author    = 'Bluebash Spree Team'
  s.email     = 'radolf@bluebash.co'
  s.homepage  = 'https://github.com/bluebash-spree-contrib/spree_notes.git'
  s.license = 'BSD-3-Clause'

  s.files       = `git ls-files`.split("\n").reject { |f| f.match(/^spec/) && !f.match(/^spec\/fixtures/) }
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '>= 4.1'
  s.add_dependency 'rails', '~> 6.0.2', '>= 6.0.2.2'
  s.add_dependency 'spree', spree_version
  s.add_dependency 'spree_backend', spree_version
  s.add_dependency 'spree_extension'

  s.add_dependency 'deface', '~> 1.0'

  # Test suite
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'spree_dev_tools'
  s.add_development_dependency 'byebug'
end
