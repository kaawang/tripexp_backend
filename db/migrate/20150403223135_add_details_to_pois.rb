class AddDetailsToPois < ActiveRecord::Migration
  def change
    add_column :pois, :user_id, :integer
    remove_column :pois, :zip
  end
end