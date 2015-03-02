require 'sprockets'
require 'redjs-sprockets'


GET_SPROCKETS = proc do

  sprockets = Sprockets::Environment.new

  sprockets.append_path CASES_DIR

  RedJS::Sprockets.auto_usage_paths << CASES_DIR + '/auto_usage'
  RedJS::Sprockets.register sprockets

  sprockets

end
