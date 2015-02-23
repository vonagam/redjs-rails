require 'sprockets'
require 'pathname'

module Redjs

  JAVASCRIPTS_PATH = Pathname.new( __FILE__ ).dirname.join( 'javascripts' ).to_s

end

require 'redjs/version'
require 'redjs/processor'
require 'redjs/sprockets/v' + Sprockets::VERSION[ 0 ]

require 'redjs/platforms/rails' if defined? Rails
require 'redjs/platforms/middleman' if defined? Middleman
