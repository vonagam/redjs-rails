require 'tilt'


module Redjs

  class Sprockets < Tilt::Template

    self.default_mime_type = 'application/javascript'

    def evaluate ( context, locals )

      result = Redjs::Processor.process context.logical_path, data

      result[ :required ].each{ | required_path | context.require_asset required_path }

      result[ :data ]

    end

    def prepare
    end

    def self.register ( sprockets )

      sprockets.register_engine 'red', self

      sprockets.append_path Redjs::JAVASCRIPTS_PATH
      
    end

  end

end
