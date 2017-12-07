require "resin/client/version"
require 'resin/config/envs'
require 'resin/support/requester'
require 'resin/client/models/application'
require 'resin/client/models/device'
require 'resin/client/models/variable'
require 'jsonclient'

module Resin

  def self.configure(token)
    @@requester = Requester.new(token)
  end

  def self.requester
    @@requester
  end

  def self.update_token
    @@requester.update_token
  end

  def self.get_applications
    applications = []
    json = @@requester.get('/v1/application')
    json['d'].each do |application_json|
      applications << Models::Application.new(application_json)
    end
    applications
  end

  def self.get_application(application_id)
    res = @@requester.get("/v1/application(#{application_id})")['d'].first
    Models::Application.new(res)
  end

  def self.get_devices
    devices = []
    json = @@requester.get('/v1/device')
    json['d'].each do |device_json|
      devices << Models::Device.new(device_json)
    end
    devices
  end

  def self.get_devices_by_application(application_id)
    devices = []
    json = @@requester.get("/v1/application(#{application_id})?$expand=device")
    json['d'].first['device'].each do |device_json|
      devices << Models::Device.new(device_json)
    end
    devices
  end

  def self.get_device(device_id)
    res = @@requester.get("/v1/device(#{device_id})")['d'].first
    Models::Device.new(res)
  end

  def self.get_device_variables(device_id)
    variables = []
    json = @@requester.get("/v1/device_environment_variable?$filter=device eq #{device_id}")['d']
    json.each do |variable_json|
      variables << Models::Variable.new(variable_json)
    end
    variables
  end

  def self.update_device_variable(variable_id, new_value)
    res = @@requester.patch("/device_environment_variable(#{variable_id})", {data: new_value})['b']
    Models::Variable.new(res)
  end
end
