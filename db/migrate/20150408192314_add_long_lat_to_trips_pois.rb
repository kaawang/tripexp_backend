class AddLongLatToTripsPois < ActiveRecord::Migration
  def change
    remove_column :trips, :geocode_location, :string
    remove_column :pois, :geocode_location, :string    
    add_column :trips, :geocode_longitude, :string
    add_column :trips, :geocode_latitude, :string
    add_column :pois, :geocode_longitude, :string
    add_column :pois, :geocode_latitude, :string  
    add_column :trips, :google_place_id, :string
    add_column :pois, :google_place_id, :string
  end
end
