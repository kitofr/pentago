require 'rubygems'
require 'spec/rake/spectask'

task :default => ['spec']

desc "Run SpecTest"
Spec::Rake::SpecTask.new do |t|
   t.spec_opts = ["--colour", "--format", "specdoc"]
   t.spec_files = FileList['spec/**/*_spec*.rb']
end

