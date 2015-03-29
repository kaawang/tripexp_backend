class CreatePois < ActiveRecord::Migration
  def change
    create_table :pois do |t|
      t.integer :trip_id 
      t.string :poi_name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip

      t.references :trip, index: true

      t.timestamps null: false
    end
  end
end




