require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc 'Run iOS tests'
task :ios do
  Dir.chdir 'ios'
  exec 'rspec'
end
 
desc 'Run Android tests'
task :android do
  Dir.chdir 'android'
  exec 'rspec'
end
