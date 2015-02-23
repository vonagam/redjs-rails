require 'pathname'


module Redjs

  class Processor

    def self.process ( path, data )

      required = []

      unless data.gsub! /\$define\s*\(/, "\\0'#{ path }',"

        unless data =~ /\$defines\s*\(\s*['"]#{ path }['"]/

          data += "\n" + "$define('#{ path }',void 0);"

        end

      end

      data.gsub! /(\$require\s*\(\s*['"])([^'"]+)(['"]\s*\))/ do

        asset_path = $2

        if asset_path[ 0 ] == '.'

          asset_path = Pathname.new( path ).dirname + asset_path

        end

        required << asset_path unless asset_path == path

        "#{ $1 }#{ asset_path }#{ $3 }"

      end

      { data: data, required: required }

    end

  end

end
