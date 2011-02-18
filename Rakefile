require 'rubygems'
require 'rspec/core/rake_task' #/rake/spectask'

task :default => ['spec']

desc "Run SpecTest"
RSpec::Core::RakeTask.new do |t|
   t.rspec_opts = ["--colour", "--format", "nested"]
   t.pattern = FileList['spec/**/*_spec*.rb']
end
