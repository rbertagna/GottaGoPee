require_relative "../../config/environment"
require_relative "../models/bathroom.rb"


class ApplicationController < Sinatra::Base
  
  def index
    if params[:bathroom].present?
      @bathrooms = Bathroom.near(params[:search], 1, :order => :distance)
    else
      @bathrooms = Bathroom.all
    end
  end
  
  post '/map' do
    "Hello World"
    erb :show
  end
  
  
  set :views, "app/views"
  set :public, "public"
  
  get "/" do
    erb :index


  end

  
end