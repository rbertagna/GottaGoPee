require 'open-uri'
require 'json'

data = JSON.parse(open("https://data.cityofnewyork.us/resource/hjae-yuav.json").read)
    data.each do |hash|
      # puts hash
      @latlong_array = Geocoder.coordinates(hash["location"])
      if @latlong_array
        puts Bathroom.create( :address => hash["location"], :open_year_round => hash["open_year_round"], :handicap => hash["handicap_accessible"], :borough => hash["borough"], :rating => nil, :latitude => @latlong_array[1], :longitude => @latlong_array[0])
        sleep(1)
      end
    end
    starbucks = JSON.parse(open("https://opendata.socrata.com/resource/ddym-zvjk.json").read)
    starbucks.each do |hash|
      # puts hash
      if hash['state']
        if hash["state"] == "NY"
            puts Bathroom.create( :address => hash["street_address"], :open_year_round => "yes", :handicap => "unknown", :borough => hash["location"]["human_address"]["city"], :rating => nil, :latitude => hash["latitude"], :longitude => hash["longitude"])
        end
      end
    end