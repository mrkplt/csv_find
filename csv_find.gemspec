require './lib/csv_find/csv_find'

Gem::Specification.new do |s|
  s.name = 'csv_find'
  s.version = CsvFind::VERSION
  s.date = '2015-05-22'
  s.authors = ['Mark Platt']
  s.email = 'mplatt@mrkplt.com'
  s.description = %q('csv_find will blah blah blah')
  s.summary = %q('blah')
  s.license = 'MIT'
  s.required_ruby_version = '>= 2.0.0'
  s.test_files = 'spec/csv_find_spec.rb'
  s.files = [
    'lib/csv_find/csv_find.rb'
  ]
  s.homepage = 'http://mrkplt.com'
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec', '~> 2.14.1'
end
