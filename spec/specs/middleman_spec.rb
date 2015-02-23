require 'middleman'
require 'redjs-sprockets'


describe 'rails' do

  before :all do

    ENV[ 'MM_ROOT' ] = 'spec/platforms/middleman'

    @sprockets = Middleman.server.inst.sprockets

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
