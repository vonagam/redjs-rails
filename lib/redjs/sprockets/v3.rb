require 'set'


module RedJS

  class Sprockets

    include RedJS::Base

    def self.call ( input )

      result = RedJS::Processor.process input[ :name ], input[ :data ]

      required = result[ :required ].map do | path | 

        input[ :environment ].resolve( path, accept: @mime_type, compat: false )[ 0 ]

      end

      { 
        data: result[ :data ],
        required: Set.new( input[ :metadata ][ :required ] ) + required
      }

    end

    def self.register ( sprockets )

      super sprockets

      sprockets.register_engine @extention, self, mime_type: @mime_type

    end

  end

end
