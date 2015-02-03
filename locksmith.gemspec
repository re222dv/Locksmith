$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'locksmith/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'locksmith'
  s.version     = Locksmith::VERSION
  s.authors     = ['Rasmus Eneman']
  s.email       = ['rasmus@eneman.eu']
  s.homepage    = 'https://github.com/re222dv/Locksmith'
  s.summary     = 'An API key handler.'
  s.description = 'An API key handler.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  # s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 4.2'
  s.add_dependency 'sass-rails'
  s.add_dependency 'bourbon'
  s.add_dependency 'neat'
  s.add_dependency 'bitters'
  s.add_dependency 'bcrypt'
  s.add_dependency 'email_validator'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'faker'
end
