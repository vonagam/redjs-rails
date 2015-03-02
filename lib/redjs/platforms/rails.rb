require 'rails/engine'


module RedJS

  module Platforms

    class Rails < ::Rails::Engine

      initializer 'redjs_rails.setup_engine', group: :all do | app |

        RedJS::Sprockets.register app.assets

      end

    end

  end

end
