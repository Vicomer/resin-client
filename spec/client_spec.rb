require 'spec_helper'


describe 'Client' do
  it 'should init requester' do
    test_value = 'aaaaaaaa'
    client = Resin::Client.new(test_value)
  end
end