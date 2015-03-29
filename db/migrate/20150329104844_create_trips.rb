class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :user_id 
      t.string :trip_name
      t.string :city
      t.string :state

      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
