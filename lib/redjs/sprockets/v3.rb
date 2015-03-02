require 'set'

# not work yet

module RedJS

  class Sprockets

    def self.call ( input )

      result = RedJS::Processor.process input[ :filename ], input[ :data ]

      required = result[ :required ].map{ | path | input[ :environment ].resolve path }

      { 
        data: result[ :data ],
        required: Set.new( input[ :metadata ][ :required ] ) + required
      }

    end

    def self.register ( sprockets )

      sprockets.register_engine '.red', self, mime_type: 'application/javascript'

      sprockets.append_path RedJS::JAVASCRIPTS_PATH

    end

  end

end
