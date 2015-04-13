require 'set'


module RedJS

  module Base

    def self.included ( base )

      base.extend ClassMethods

      base.class_eval do

        @mime_type = 'application/javascript'

        @extention = :red

        @processor = proc do | context, data |

          result = RedJS::Processor.process context.logical_path, data

          result[ :required ].each { | required_path | context.require_asset required_path }

          result[ :data ]

        end

      end

    end

    module ClassMethods

      def auto_usage_paths

        @auto_usage_paths ||= Set.new

      end

      def register ( sprockets )

        sprockets.append_path RedJS::JAVASCRIPTS_PATH

        auto_usage_paths.each { | auto_usage | sprockets.prepend_path auto_usage }

        sprockets.register_postprocessor @mime_type, @extention do | context, data |

          path = context.pathname.to_s

          if path !~ /\.red[^\/]*$/ && auto_usage_paths.any? { | auto_usage | path.include?( auto_usage.to_s ) }

            @processor.call context, data

          else

            data

          end 

        end

      end

    end

  end

end
