require_relative "../../config/environment"
require_relative "../models/bathroom.rb"


class ApplicationController < Sinatra::Base
  
  set :views, "app/views"
  set :public, "public"
  
  get "/" do


  end

  
end