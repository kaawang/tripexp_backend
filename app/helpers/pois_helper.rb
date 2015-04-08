require "net/http"
require "uri"

module PoisHelper
  def create_poi(input)
    address_hash = input["poisAddressArray"]
    address_hash.each do |hash|
      Poi.create(
        trip_id: params[:trip_id],
        address: hash["value"]
        )
    end
  end

  def geocode_converter(input)
    format_address = input.gsub(" ","+")
    geocode_url = "https://maps.googleapis.com/maps/api/geocode/json?address="+ format_address +"&key=ENV['GOOGLE_SERVER_API_KEY']"
    uri = URI.parse(geocode_url)
    response = Net::HTTP.get_response(uri)
    return response.body
  end

require "net/http"
require "uri"

  def geocode_converter(input)
    format_address = input.gsub(" ","+")
    geocode_url = "https://maps.googleapis.com/maps/api/geocode/json?address="+ format_address +"&key=AIzaSyCdWg-wpXVhhfuPMNjFUngHSEop7No3jIo"
    uri = URI.parse(geocode_url)
    response = Net::HTTP.get_response(uri)
    return response.body
  end  
end
