require "resin/client/version"
require 'resin/config/envs'
require 'resin/support/requester'
require 'resin/client/models/application'
require 'resin/client/models/device'
require 'resin/client/models/variable'
require 'jsonclient'

module Resin

  def self.configure(token)
    @@token = token
    @@requester = Requester.new(@@token)
  end

  def self.get_applications
    applications = []
    json = @@requester.get('/application')
    json['d'].each do |application_json|
      applications << Models::Application.new(application_json)
    end
    applications
  end

  def self.get_application(application_id)
    res = @@requester.get("/application(#{application_id})")['d'].first
    Models::Application.new(res)
  end

  def self.get_devices
    devices = []
    json = @@requester.get('/device')
    json['d'].each do |device_json|
      devices << Models::Device.new(device_json)
    end
    devices
  end

  def self.get_devices_by_application(application_id)
    devices = []
    json = @@requester.get("/application(#{application_id})?$expand=device")
    json['d'].first['device'].each do |device_json|
      devices << Models::Device.new(device_json)
    end
    devices
  end

  def self.get_device(device_id)
    res = @@requester.get("/device(#{device_id})")['d'].first
    Models::Device.new(res)
  end

  def self.get_device_variables(device_id)
    res = @@requester.get("/device_environment_variable?$filter=device eq #{device_id}")['d'].first
    Models::Variable.new(res)
  end
end
