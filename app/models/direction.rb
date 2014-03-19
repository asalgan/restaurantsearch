class Direction < ActiveRecord::Base
  require 'open-uri'
  require 'json' 

  attr_accessor :start
  attr_accessor :destination


  def turn_url_into_hash(url_string)
    url = URI.encode(url_string)
    string = open(url).read
    hash = JSON.parse(string)

    return hash
  end

  def google_directions
  hash = turn_url_into_hash("http://maps.googleapis.com/maps/api/geocode/json?address=#{params[:zip]}&sensor=false")

  start_lat = hash["results"].first["geometry"]["location"]["lat"]
  start_long = hash["results"].first["geometry"]["location"]["lng"]

  start_cords = [start_lat, start_long]

  hash = turn_url_into_hash("http://maps.googleapis.com/maps/api/geocode/json?address=#{self.finish}&sensor=false")


  finish_lat = hash["results"].first["geometry"]["location"]["lat"]
  finish_long = hash["results"].first["geometry"]["location"]["lng"]

  finish_cords = [finish_lat, finish_long]

  directions_hash = turn_url_into_hash("http://maps.googleapis.com/maps/api/directions/json?origin=#{start_cords.first},#{start_cords.last}&destination=#{finish_cords.first},#{finish_cords.last}&mode=transit&departure_time=#{Time.now.to_i}&sensor=false")


    return directions_hash
  end

end

