require 'spec_helper'


describe 'Application' do

  let(:token){ @token }
  let!(:client){ Resin.configure(@token) }

  it 'should list all applications' do
    apps = Resin.get_applications
    expect(apps.first.class).to eq Resin::Models::Application
  end

  it 'should get a specific application' do
    app = Resin.get_application(701038)
    expect(app.class).to eq Resin::Models::Application
  end
end