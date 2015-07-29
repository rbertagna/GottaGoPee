require_relative "../../config/environment.rb"
require "geocoder/railtie"
Geocoder::Railtie.insert


class Bathroom < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?


end