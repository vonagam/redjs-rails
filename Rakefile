require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'


RSpec::Core::RakeTask.new do | t |

  t.pattern = 'spec/spec_runner.rb'
  t.verbose = false

end


task default: :spec
