require 'spec_helper'

describe 'Device' do

  let(:token){ @token }
  let!(:client){ Resin.configure(@token) }

  it 'should return all devices' do
    devices = Resin.get_devices
    expect(devices.first.class).to eq Resin::Models::Device
  end

  it 'should return specific device' do
    device = Resin.get_device(883549)
    expect(device.class).to eq Resin::Models::Device
  end
end