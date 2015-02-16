module Redjs

  module Rails

    class Processor < Sprockets::Processor

      self.default_mime_type = 'application/javascript'

      def evaluate ( context, locals )

        current_path = context.logical_path

        result = data

        unless result.gsub! /\$define\s*\(/, "\\0'#{current_path}',"

          unless result =~ /\$defines\s*\(\s*['"]#{ current_path }['"]/

            result += "\n" + "$define('#{ current_path }',0);"

          end

        end

        result.gsub! /(\$require\s*\(\s*['"])([^'"]+)(['"]\s*\))/ do

          asset_path = $2

          if asset_path[ 0 ] == '.'

            asset_path = Pathname.new( context.logical_path ).dirname + asset_path

          end

          context.require_asset asset_path

          "#{ $1 }#{ asset_path }#{ $3 }"

        end

        result

      end

    end

  end

end
