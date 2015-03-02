describe 'redjs' do

  before :all do

    @sprockets = GET_SPROCKETS.call

  end

  it 'red processor registered' do

    expect( @sprockets.engines[ '.red' ] ).to be RedJS::Sprockets
    expect( @sprockets.paths ).to include RedJS::JAVASCRIPTS_PATH

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
