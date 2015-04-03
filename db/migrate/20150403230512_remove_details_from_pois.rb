class RemoveDetailsFromPois < ActiveRecord::Migration
  def change
    remove_column :pois, :state 
    remove_column :pois, :city
  end
end