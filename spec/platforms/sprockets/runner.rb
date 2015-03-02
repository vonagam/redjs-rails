require 'sprockets'
require 'redjs-sprockets'


GET_SPROCKETS = proc do

  sprockets = Sprockets::Environment.new

  sprockets.append_path CASES_DIR

  Redjs::Sprockets.auto_usage_paths << CASES_DIR + '/auto_usage'
  Redjs::Sprockets.register sprockets

  sprockets

end
