require_relative "../../config/environment"
require_relative "../models/bathroom.rb"
# require "pry"
require "open-uri"
require "json"
require "pp"


class ApplicationController < Sinatra::Base
  
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
  

  post '/map' do
    @location_array = Geocoder.coordinates(params[:location])
    # data = JSON.parse(open("https://data.cityofnewyork.us/resource/hjae-yuav.json").read)
    # data.each do |hash|
    #   # puts hash
    #   @latlong_array = Geocoder.coordinates(hash["location"])
    #   if @latlong_array
    #     puts Bathroom.create( :address => hash["location"], :open_year_round => hash["open_year_round"], :handicap => hash["handicap_accessible"], :borough => hash["borough"], :rating => nil, :latitude => @latlong_array[1], :longitude => @latlong_array[0])
    #     sleep(1)
    #   end
    # end
    # starbucks = JSON.parse(open("https://opendata.socrata.com/resource/ddym-zvjk.json").read)
    # starbucks.each do |hash|
    #   # puts hash
    #   if hash['state']
    #     if hash["state"] == "NY"
    #       # binding.pry
    #       # @latlong_array = Geocoder.coordinates(hash["location"]["human_address"])
    #       # binding.pry
    #       # if @latlong_array
    #         puts Bathroom.create( :address => hash["street_address"], :open_year_round => "yes", :handicap => "unknown", :borough => hash["location"]["human_address"]["city"], :rating => nil, :latitude => hash["latitude"], :longitude => hash["longitude"])
    #       # end
    #       # Bathroom.last.longitude = hash["location"]["longitude"]
    #       # puts Bathroom.last.longitude
    #       # sleep(1)
    #     end
    #   end
    # end

    @close_bathrooms = Bathroom.near(@location_array, 1)
    @close_bathrooms_show = []
    @close_bathrooms.each do |bathroom|
      @close_bathrooms_show << [bathroom.longitude, bathroom.latitude]
    end
    erb :show
  end

  get '/map' do
    redirect '/'
  end

  
end