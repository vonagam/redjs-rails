require 'rails/engine'


module Redjs

  module Platforms

    class Rails < ::Rails::Engine

      initializer 'redjs_rails.setup_engine', group: :all do | app |

        Redjs::Sprockets.register app.assets

      end

    end

  end

end
