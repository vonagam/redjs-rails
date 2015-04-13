require 'set'


module RedJS

  class Sprockets < Sprockets::Processor

    include RedJS::Base

    self.default_mime_type = @mime_type

    def self.register ( sprockets )

      super sprockets

      sprockets.register_engine @extention, self
      
    end

  end

end
