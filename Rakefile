require "bundler/gem_tasks"

task :default => :test

require 'rake/testtask'
desc "Run the test suite"
Rake::TestTask.new do |t|
  t.libs = [File.expand_path("lib"), "test"]
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

