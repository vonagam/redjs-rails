require 'middleman-core'
require 'pry'


module Redjs

  module Platforms

    class Middleman < ::Middleman::Extension

      def initialize ( app, options_hash = {}, &block )

        super

        ::Tilt.register 'red', Redjs::Sprockets

        app.after_configuration do

          Redjs::Sprockets.register sprockets

        end

      end

    end

  end

end


::Middleman::Extensions.register :redjs_sprockets, Redjs::Platforms::Middleman
