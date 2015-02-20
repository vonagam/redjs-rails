# coding: utf-8

lib = File.expand_path( '../lib', __FILE__ )
$LOAD_PATH.unshift( lib ) unless $LOAD_PATH.include?( lib )
require 'redjs/rails/version'

Gem::Specification.new do | spec |

  spec.name          = 'redjs-rails'
  spec.version       = Redjs::Rails::VERSION
  spec.authors       = [ 'Dmitry Maganov' ]
  spec.email         = [ 'vonagam@gmail.com' ]
  spec.summary       = 'JS dependency sugar for Sprockets.'
  spec.description   = 'Require by path, Define without key. Permissive towards Sprockets directives and global scope pollution.'
  spec.homepage      = 'https://github.com/vonagam/redjs-rails'
  spec.license       = 'MIT'

  spec.files         = Dir[
    'lib/**/*',
    'Gemfile',
    'Rakefile',
    'README.md',
    'LICENSE.txt',
    'redjs-rails.gemspec'
  ]
  spec.require_paths = [ 'lib' ]


  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'combustion', '~> 0.5.2'
  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'execjs'

  spec.add_dependency 'sprockets', '~> 2.0'

end
