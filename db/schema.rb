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

ActiveRecord::Schema.define(version: 2021_07_30_165305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "amenities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "listings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "property_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.integer "price"
    t.string "measurement"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "num_bedrooms"
    t.integer "num_bathrooms"
    t.integer "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "property_amenities", force: :cascade do |t|
    t.integer "property_id", null: false
    t.integer "amenity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "property_reviews", force: :cascade do |t|
    t.decimal "cleanliness", precision: 2, scale: 1
    t.decimal "accuracy", precision: 2, scale: 1
    t.decimal "communication", precision: 2, scale: 1
    t.decimal "location", precision: 2, scale: 1
    t.decimal "value", precision: 2, scale: 1
    t.string "comment"
    t.integer "month"
    t.integer "year"
    t.integer "user_id", null: false
    t.integer "property_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_reviews", force: :cascade do |t|
    t.decimal "general", precision: 2, scale: 1
    t.string "comment"
    t.integer "month"
    t.integer "year"
    t.integer "user_id", null: false
    t.integer "property_id", null: false
    t.integer "reviewed_by", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "password"
    t.boolean "admin"
    t.string "email"
    t.string "phone_number"
    t.integer "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
