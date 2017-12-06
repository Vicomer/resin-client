require 'spec_helper'

describe 'Device' do

  let(:token){ @token }


  it 'should should have all the needed data' do
    Resin.configure(@token)
    old_token = @token
    Resin.update_token
    expect(Resin.requester.token).not_to eq old_token
  end
end