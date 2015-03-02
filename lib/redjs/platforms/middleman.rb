require 'middleman-core'


module Redjs

  module Platforms

    class Middleman < ::Middleman::Extension

      option :auto_usage, [], 'Array of paths where the ".red" file extension is auto assumed.' 

      def initialize ( app, options = {}, &block )

        super

        Redjs::Sprockets.auto_usage_paths.merge options[ :auto_usage ]

        ::Tilt.register :red, Redjs::Sprockets

        app.after_configuration do

          Redjs::Sprockets.register sprockets

        end

      end

    end

  end

end


::Middleman::Extensions.register :redjs_sprockets, Redjs::Platforms::Middleman
