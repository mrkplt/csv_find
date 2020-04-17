# frozen_string_literal: true

require './lib/csv_find/csv_find'

Gem::Specification.new do |s|
  s.name = 'csv_find'
  s.version = CsvFind::VERSION
  s.date = '2020-04-17'
  s.authors = ['Mark Platt']
  s.email = 'mplatt@mrkplt.com'
  s.description = 'csv_find quickly finds rows and creates an instance with that data'
  s.summary = 'This uses some command line tools to take CSV\'s apart and put them together to quickly find specific rows in a csv.'
  s.license = 'MIT'
  s.required_ruby_version = '>= 2.5.0'
  s.test_files = 'spec/csv_find_spec.rb'
  s.files = [
    'lib/csv_find/csv_find.rb'
  ]
  s.homepage = 'http://mrkplt.com'
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec', '~> 3.9.0'
  s.add_development_dependency 'rubocop', '~> 0.82.0'
end
