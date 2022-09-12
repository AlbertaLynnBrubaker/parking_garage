# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_11_232810) do
  create_table "commuters", force: :cascade do |t|
    t.string "vehicle_make_and_model"
    t.string "license_plate_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parking_spaces", force: :cascade do |t|
    t.integer "space_number"
    t.integer "floor"
    t.boolean "occupied", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "parking_space_id", null: false
    t.integer "commuter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commuter_id"], name: "index_tickets_on_commuter_id"
    t.index ["parking_space_id"], name: "index_tickets_on_parking_space_id"
  end

  add_foreign_key "tickets", "commuters"
  add_foreign_key "tickets", "parking_spaces"
end
