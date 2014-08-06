require 'open-uri'
require 'json' 

class Menu < ActiveRecord::Base

	#HTTParty might be good for seeing error messages from bad requests directly in console

	has_many :favorites
  has_many :users, through: :favorites

  def self.turn_url_into_hash(url_string)
    url = URI.encode(url_string)
    string = open(url).read
    hash = JSON.parse(string)

    return hash
  end

 def self.get_by_location(location)
  user_location_hash = turn_url_into_hash("http://maps.googleapis.com/maps/api/geocode/json?address=#{location}&sensor=false")

  start_lat = user_location_hash["results"].first["geometry"]["location"]["lat"]
  start_long = user_location_hash["results"].first["geometry"]["location"]["lng"]

  start_cords = [start_lat, start_long]
	
  restaurant_location_hash = turn_url_into_hash("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{start_lat},#{start_long}&key=AIzaSyD61SLiTtkrATEA07q7r60XZEpBHXoz5fg&sensor=false&radius=200&types=restaurant|bakery|cafe|food|meal_delivery|meal_takeaway")
  restaurants = restaurant_location_hash["results"]
  
  menus = []

  restaurants.each do |restaurant|
  	menus << Menu.where(:restaurant => restaurant["name"])
    #binding.pry
  end
  return menus.flatten.compact

 end
  
end
