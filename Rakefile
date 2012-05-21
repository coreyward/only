$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require "only/version"
 
task :build do
  system "gem build only.gemspec"
end

task :install => :build do
  system "gem install only-#{Only::VERSION}"
end
 
task :release => :build do
  system "gem push only-#{Only::VERSION}"
end
