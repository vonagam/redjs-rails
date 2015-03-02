require 'middleman'
require 'middleman-core/application.rb'
require 'redjs-sprockets'


GET_SPROCKETS = proc do

  ENV[ 'MM_ROOT' ] = 'spec/platforms/middleman'

  sprockets = Middleman.server.inst.sprockets

end
