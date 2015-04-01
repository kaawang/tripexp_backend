class AddDetailsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :startdate, :string
    add_column :trips, :enddate, :string
    rename_column :trips, :city, :location
    remove_column :trips, :state
  end
end