require 'spec_helper'

describe 'Device' do

  let(:token){ @token }


  it 'should should have all the needed data' do
    Resin.configure(@token)
    # Resin.update_token
  end
end