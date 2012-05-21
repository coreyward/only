# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'only/version'
 
Gem::Specification.new do |s|
  s.name        = "only"
  s.version     = Only::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Corey Ward"]
  s.email       = ["corey.atx@gmail.com"]
  s.homepage    = "http://github.com/jonesdilworth/only"
  s.summary     = "Define Rails route constraints easier"
  s.description = "Only makes writing route constraints for Rails 3+ applications easier by providing a simple DSL and several helpers."
 
  s.required_rubygems_version = ">= 1.8"
  s.rubyforge_project         = "only"
 
  s.files        = Dir.glob("{lib}/**/*") + %w(LICENSE README.md)
  s.require_path = 'lib'
end
