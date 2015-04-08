module PoisHelper
  def create_poi(input)
  include HTTParty
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
    geocode_url = "https://maps.googleapis.com/maps/api/geocode/json?address="+ format_address +"&key=" + ENV["GOOGLE_SERVER_API_KEY"]
    response = HTTParty.get(geocode_url)  
    json_package_place_coord = response.parsed_response["results"].last
    return json_package_place_coord
  end
end
