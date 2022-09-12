class CreateCommuters < ActiveRecord::Migration[7.0]
  def change
    create_table :commuters do |t|
      t.string :vehicle_make_and_model
      t.string :license_plate_number

      t.timestamps
    end
  end
end
