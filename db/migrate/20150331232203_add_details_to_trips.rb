class AddDetailsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :start_date, :string
    add_column :trips, :end_date, :string
    rename_column :trips, :city, :location
    remove_column :trips, :state
  end
end