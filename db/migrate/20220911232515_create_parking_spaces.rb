class CreateParkingSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :parking_spaces do |t|
      t.integer :space_number
      t.integer :floor
      t.boolean :occupied, default: false

      t.timestamps
    end
  end
end
