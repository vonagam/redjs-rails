require 'sprockets'
require 'redjs-sprockets'


describe 'sprockets' do

  before :all do

    @sprockets = Sprockets::Environment.new

    @sprockets.append_path CASES_DIR

    Redjs::Sprockets.register @sprockets
    Redjs::Sprockets.auto_usage_paths << CASES_DIR + '/preprocessor'

  end

  it 'red processor registered' do

    expect( @sprockets.engines[ '.red' ] ).to be Redjs::Sprockets
    expect( @sprockets.paths ).to include Redjs::JAVASCRIPTS_PATH

  end

  describe 'cases' do

    CASES.each do | name |

      it name do

        asset = @sprockets.find_asset name

        expect( asset ).not_to be nil

        ExecJS.exec asset.source

      end

    end

  end

end
