module TripsHelper
  include HTTParty

  def geocode_converter(input)
    format_address = input.gsub(" ","+")
    geocode_url = "https://maps.googleapis.com/maps/api/geocode/json?address="+ format_address +"&key=" + ENV["GOOGLE_SERVER_API_KEY"]
    response = HTTParty.get(geocode_url)  
    json_package_place_coord = response.parsed_response["results"].last
    return json_package_place_coord
  end
end