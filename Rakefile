require 'rake/testtask'
require 'rspec/core/rake_task'require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
end
require 'minitest/autorun'
require 'minitest/pride'


Rake::TestTask.new do |t|
  t.pattern = "test/**/*_test.rb"
end

RSpec::Core::RakeTask.new(:spec)

task default: :test