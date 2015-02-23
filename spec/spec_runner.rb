require 'pry'
require 'execjs'


CASES_DIR = Pathname.new( __FILE__ ).dirname.join( 'cases' ).to_s


CASES = Dir[ 'spec/cases/**/entry.*' ].each do | entry |

  entry.sub! 'spec/cases/', ''

  entry.sub! /^([^\.]+)\..+$/, '\1'

end


[ 'rails', 'middleman', 'sprockets' ].each do | gem_name |

  if Gem.find_files( gem_name ).empty? == false

    require "specs/#{ gem_name }_spec"

    break

  end

end
