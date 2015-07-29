require_relative "../../config/environment"
require_relative "../models/bathroom.rb"
require "pry"


class ApplicationController < Sinatra::Base
  
  post '/map' do    
    @location_array = Geocoder.coordinates(params[:location])
    # binding.pry
    erb :show
  end
  
  
  set :views, "app/views"
  set :public, "public"
  
  get "/" do
    # @bowlinggreen = Bathroom.create(:address => "11 broadway")
    # if params[:bathroom].present?
    #   # @bathrooms = Bathroom.near(params[:search], 1, :order => :distance)
    # else
    #   @bathrooms = Bathroom.all
    # end
    erb :index
  end

  
end