require 'rails/engine'

module Redjs

  module Rails

    class Engine < ::Rails::Engine

      initializer 'redjs_rails.setup_engine', group: :all do | app |

        app.assets.register_engine '.red', Processor

      end

    end

  end

end
