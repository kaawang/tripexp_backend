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
    
  end
end