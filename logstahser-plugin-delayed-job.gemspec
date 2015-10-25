require './lib/logstasher/plugin/delayed/version'

Gem::Specification.new do |s|
  s.name        = 'logstasher-plugin-delayed'
  s.version     = LogStasher::Plugin::Delayed::VERSION
  s.authors     = ['Marc Grimme']
  s.email       = ['marc.grimme@gmail.com']
  s.homepage    = 'https://github.com/marcgrimme/logstasher-plugin-delayed'
  s.summary     = s.description = 'Awesome rails logs supports delayed jobs'
  s.license     = 'MIT'

  s.files         = `git ls-files lib/plugin/delayed`.split("\n")

  s.add_runtime_dependency 'logstasher', '0.8.0'
  s.add_runtime_dependency 'delayed_job', '~> 4.0.2'

  s.add_development_dependency('rspec', '>= 2.14')
  s.add_development_dependency('bundler', '>= 1.0.0')
  s.add_development_dependency('rails', '>= 3.0')
end
