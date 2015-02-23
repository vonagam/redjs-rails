# coding: utf-8

lib = File.expand_path( '../lib', __FILE__ )
$LOAD_PATH.unshift( lib ) unless $LOAD_PATH.include?( lib )
require 'redjs/version'

Gem::Specification.new do | spec |

  spec.name          = 'redjs-sprockets'
  spec.version       = Redjs::VERSION
  spec.authors       = [ 'Dmitry Maganov' ]
  spec.email         = [ 'vonagam@gmail.com' ]
  spec.summary       = 'JS dependency sugar for Sprockets.'
  spec.description   = 'Require by path, Define without key. Permissive towards Sprockets directives and global scope pollution.'
  spec.homepage      = 'https://github.com/vonagam/redjs-sprockets'
  spec.license       = 'MIT'

  spec.files         = Dir[
    'lib/**/*',
    'README.md',
    'LICENSE.txt'
  ]
  spec.require_paths = [ 'lib' ]


  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'execjs'
  spec.add_development_dependency 'pry'

  spec.add_dependency 'sprockets', '>= 2.2.2'

end
