require 'spec_helper'

describe 'Variables' do

  let(:token){ @token }
  let!(:client){ Resin.configure(@token) }

  it 'should get variables for a device' do
    var = Resin.get_device_variables(883549)
    expect(var.class).to eq Resin::Models::Variable
  end
end