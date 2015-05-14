module PoisHelper
  include HTTParty
  
  def geocode_converter(input)
    format_address = input.gsub(" ","+")
    geocode_url = "https://maps.googleapis.com/maps/api/geocode/json?address="+ format_address +"&key=" + ENV["GOOGLE_SERVER_API_KEY"]
    response = HTTParty.get(geocode_url)  
    json_package_place_coord = response.parsed_response["results"].last
    return json_package_place_coord
  end

  def create_poi(input)
    address_hash = input["poisAddressArray"]
    address_hash.each do |hash|
      geocode_response = geocode_converter(hash["value"])
      hash_coordinates = geocode_response["geometry"]["location"]
      hash_place_id = geocode_response["place_id"]
      poiName = address_name_getter(hash["value"])
      Poi.create(
        trip_id: params[:trip_id],
        poi_name: poiName,
        address: hash["value"],
        geocode_longitude: hash_coordinates["lng"],
        geocode_latitude: hash_coordinates["lat"],
        google_place_id: hash_place_id        
        )
    end
  end

  def address_name_getter(input)
    full_address = input
    result = []
    full_address_array = full_address.split("")
    comma_index = full_address_array.find_index(",")-1
    full_address_array.each_index do |e|
      result.push(full_address_array[e]) if e <= comma_index
    end
    result.join()
  end
end