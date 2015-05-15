module PoisHelper
  include HTTParty

  def places_converter(input)
    format_address = input.gsub(" ", "+")
    trip = Trip.where(user_id: params[:user_id], id: params[:trip_id]).pluck("geocode_latitude","geocode_longitude")
    textsearch_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=" + format_address + "&location=" + trip[0][0] + "," + trip[0][1] + "&radius=40000&key=" + ENV["GOOGLE_SERVER_API_KEY"]
    response = HTTParty.get(textsearch_url)
  end

  def create_poi(input)
    address_hash = input["poisAddressArray"]
    address_hash.each do |hash|
      place_response = places_converter(hash["value"])
      hash_coordinates = place_response["results"][0]["geometry"]["location"]
      hash_place_id = place_response["results"][0]["place_id"]
      place_description = get_place_description(hash_place_id)
      p place_description
      place_response["results"][0].has_key?("name") ? poiName = place_response["results"][0]["name"] : poiName = address_name_getter(hash["value"])
      place_description["result"].has_key?("opening_hours") ? opening_hours = place_description["result"]["opening_hours"]["weekday_text"] : opening_hours = "N/A"
      place_description["result"].has_key?("formatted_phone_number") ? phone_number = place_description["result"]["formatted_phone_number"] : phone_number = "N/A"
      Poi.create(
        trip_id: params[:trip_id],
        poi_name: poiName,
        address: place_response["results"][0]["formatted_address"],
        geocode_longitude: hash_coordinates["lng"],
        geocode_latitude: hash_coordinates["lat"],
        google_place_id: hash_place_id,
        open_hours: opening_hours,
        phone_number: phone_number
        )
    end
  end

  def address_name_getter(input) # This method executes if and when place result does not have a name. 
    full_address = input
    result = []
    full_address_array = full_address.split("")
    comma_index = full_address_array.find_index(",")-1
    full_address_array.each_index do |e|
      result.push(full_address_array[e]) if e <= comma_index
    end
    result.join()
  end

  def get_place_description(input) # consider using HTTP request on client side to obtain data.. will be costly to store descriptions in database vs API request consumption
    place_url = "https://maps.googleapis.com/maps/api/place/details/json?placeid="+ input +"&key=" + ENV["GOOGLE_SERVER_API_KEY"]
    response = HTTParty.get(place_url)
  end
end