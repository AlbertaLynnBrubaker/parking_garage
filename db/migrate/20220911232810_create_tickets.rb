class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.belongs_to :parking_space, null: false, foreign_key: true
      t.belongs_to :commuter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
