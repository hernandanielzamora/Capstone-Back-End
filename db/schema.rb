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

ActiveRecord::Schema[7.0].define(version: 2023_08_23_180712) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: :cascade do |t|
    t.string "city", null: false
  end

  create_table "reservation_rooms", force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.bigint "room_id", null: false
    t.index ["reservation_id"], name: "index_reservation_rooms_on_reservation_id"
    t.index ["room_id"], name: "index_reservation_rooms_on_room_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "reservation_date", null: false
    t.string "city", null: false
    t.decimal "total_cost", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", null: false
    t.integer "guest", null: false
    t.integer "beds", null: false
    t.text "description", null: false
    t.string "photo", null: false
    t.decimal "cost", null: false
    t.boolean "reserved", default: false, null: false
    t.bigint "branch_id", null: false
    t.index ["branch_id"], name: "index_rooms_on_branch_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reservation_rooms", "reservations"
  add_foreign_key "reservation_rooms", "rooms"
  add_foreign_key "reservations", "users"
  add_foreign_key "rooms", "branches"
end
