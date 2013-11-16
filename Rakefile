gem 'rspec'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ["--format documentation", "--color", "--order=default"]
  t.pattern = ARGV[1] || "tests/*_spec.rb"
end

task :default => :spec
