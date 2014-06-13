$:.push File.expand_path('../lib', __FILE__)
require 'tjplurk/version'

Gem::Specification.new do |s|
  s.name        = 'tjplurk'
  s.version     = Tjplurk::VERSION
  s.licenses    = ['MIT']
  s.summary     = 'Plurk API Wrapper'
  s.description = 'Plurk API Wrapper'
  s.authors     = ['Tony Jian']
  s.email       = 'tonytonyjan@gmail.com'
  s.files       = Dir['lib/**/*.rb']
  s.executables = 'tjplurk'
  s.homepage    = 'https://github.com/tonytonyjan/tjplurk'
  s.add_runtime_dependency 'oauth'
  s.add_runtime_dependency 'thor'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'launchy'
end