require 'tilt'


module Redjs

  class Sprockets < Tilt::Template

    class << self
      
      attr_accessor :auto_usage_paths

      def evaluate ( context, data )

        result = Redjs::Processor.process context.logical_path, data

        result[ :required ].each{ | required_path | context.require_asset required_path }

        result[ :data ]

      end

      def register ( sprockets )

        sprockets.register_engine 'red', self

        sprockets.register_preprocessor 'application/javascript', :red do | context, data |

          path = context.pathname.to_s

          if path !~ /\.red[^\/]*$/ && auto_usage_paths.any?{ | allowed | path.include?( allowed.to_s ) }

            evaluate context, data

          else

            data

          end 

        end

        sprockets.append_path Redjs::JAVASCRIPTS_PATH
        
      end
    
    end

    self.auto_usage_paths = []

    self.default_mime_type = 'application/javascript'

    def evaluate ( context, locals )

      self.class.evaluate context, data

    end

    def prepare
    end

  end

end
