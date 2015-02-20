require 'execjs'

require 'combustion'
Combustion.initialize! :sprockets
require 'rspec/rails'


describe 'rails' do

  sprockets_index = Rails.application.assets

  it 'red processor registered' do

    expect( sprockets_index.engines[ '.red' ] ).to be Redjs::Rails::Processor

  end

  describe 'cases' do

    Dir[ 'spec/cases/**/entry.*' ].each do | entry |

      name = entry.sub 'spec/cases/', ''

      name.sub! /^([^\.]+)\..+$/, '\1'

      it name do

        asset = sprockets_index.find_asset name

        expect( asset ).not_to be nil

        ExecJS.exec asset.source

      end

    end

  end

end
