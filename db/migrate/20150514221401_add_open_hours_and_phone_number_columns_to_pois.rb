class AddOpenHoursAndPhoneNumberColumnsToPois < ActiveRecord::Migration
  def change
    add_column :pois, :open_hours, :string
    add_column :pois, :phone_number, :string
  end
end
