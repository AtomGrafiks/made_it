$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'made_it/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'made_it'
  s.version     = MadeIt::VERSION
  s.authors     = ['Gregory DALMAR']
  s.email       = ['atom@42.fr']

  s.summary     = 'A powerful gem to make what you want at your place'
  s.description = 'A powerful gem to make what you want at your place'
  s.homepage    = 'https://github.com/AtomGrafiks/madeit'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '>= 5.0.0'
  s.add_dependency 'activerecord'

  s.add_development_dependency 'sqlite3'
end
