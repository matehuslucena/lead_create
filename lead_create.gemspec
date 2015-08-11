Gem::Specification.new do |s|
  s.name        = 'lead_create'
  s.version     = '1.0.0'
  s.date        = '2015-08-10'
  s.summary     = 'Lead create'
  s.description = 'A gem to create a lead in the salesforce'
  s.authors     = ['Matheus Lucena']
  s.email       = 'matheuslucena@gmail.com'
  s.files       = ['lib/lead_create.rb']
  s.homepage    = 'http://rubygems.org/gems/lead_create'
  s.license       = 'MIT'

  s.add_dependency 'databasedotcom', '~> 1.3'

  s.add_development_dependency 'rspec', '~> 3.3'
end