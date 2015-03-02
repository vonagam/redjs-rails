require 'middleman-core'


module RedJS

  module Platforms

    class Middleman < ::Middleman::Extension

      option :auto_usage, [], 'Array of paths where the ".red" file extension is auto assumed.' 

      def initialize ( app, options = {}, &block )

        super

        RedJS::Sprockets.auto_usage_paths.merge options[ :auto_usage ]

        ::Tilt.register :red, RedJS::Sprockets

        app.after_configuration do

          RedJS::Sprockets.register sprockets

        end

      end

    end

  end

end


::Middleman::Extensions.register :redjs_sprockets, RedJS::Platforms::Middleman
