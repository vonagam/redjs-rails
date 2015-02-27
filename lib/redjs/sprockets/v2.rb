require 'set'


module Redjs

  class Sprockets < Sprockets::Processor

    self.default_mime_type = 'application/javascript'

    @processor = proc do | context, data |

      result = Redjs::Processor.process context.logical_path, data

      result[ :required ].each{ | required_path | context.require_asset required_path }

      result[ :data ]

    end

    def self.auto_usage_paths

      @auto_usage_paths ||= Set.new

    end

    def self.register ( sprockets )

      sprockets.append_path Redjs::JAVASCRIPTS_PATH

      sprockets.register_engine :red, self

      sprockets.register_postprocessor default_mime_type, :red do | context, data |

        path = context.pathname.to_s

        if path !~ /\.red[^\/]*$/ && auto_usage_paths.any?{ | allowed | path.include?( allowed.to_s ) }

          @processor.call context, data

        else

          data

        end 

      end
      
    end

  end

end
