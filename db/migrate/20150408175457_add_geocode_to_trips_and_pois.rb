class AddGeocodeToTripsAndPois < ActiveRecord::Migration
  def change
    add_column :trips, :geocode_location, :string
    add_column :pois, :geocode_location, :string
  end
end
