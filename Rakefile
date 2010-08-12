require 'rake'

desc 'Default: run unit tests.'
task :default => :test

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = 'rails-i18n-updater'
  gem.summary = 'Rails plugin to automatically fetch and update Rails core translations in a Rails application'
  gem.description = 'This Rails plugin provides the rake task i18n:update to download the latest core translations to vendor/rails-locales. On application start, the plugin automatically prepends downloaded core translations to the I18n load_path. So the downloaded core translations are automatically used in your application, but you can still override the defaults in your own locale files.'
  gem.homepage = 'http://github.com/zargony/rails-i18n-updater'
  gem.authors = ['Andreas Neuhaus']
  gem.add_dependency 'activesupport'
  gem.add_dependency 'actionpack'
  gem.has_rdoc = false
  gem.add_development_dependency 'mocha'
end
Jeweler::GemcutterTasks.new

require 'rake/testtask'
task :test => :check_dependencies
desc 'Test the rails-i18n-updater plugin.'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rake/rdoctask'
desc 'Generate documentation for the rails-i18n-updater plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ''
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = "Rails I18N Updater #{version}"
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
