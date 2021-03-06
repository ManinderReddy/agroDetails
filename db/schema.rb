# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141130100857) do

  create_table "comments", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id", "created_at"], name: "index_comments_on_post_id_and_created_at"

  create_table "crops", force: true do |t|
    t.string   "crop_name"
    t.integer  "crop_acarage"
    t.string   "season"
    t.date     "from_date"
    t.date     "to_date"
    t.integer  "expected_yeild"
    t.integer  "actual_yeild"
    t.text     "Other_details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "farm_detail_id"
  end

  create_table "farm_details", force: true do |t|
    t.integer  "user_id"
    t.float    "farm_area"
    t.string   "farm_address"
    t.text     "farm_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "farm_city"
    t.string   "farm_state"
    t.string   "farm_name"
    t.string   "soil_type"
  end

  add_index "farm_details", ["farm_name"], name: "index_farm_details_on_farm_name", unique: true
  add_index "farm_details", ["user_id"], name: "index_farm_details_on_user_id"

  create_table "fertilizers", force: true do |t|
    t.integer  "crop_id"
    t.string   "fertilizer_name"
    t.date     "fertilizer_added_on"
    t.integer  "amount_of_fertilizer"
    t.string   "other_details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lookup_fields", force: true do |t|
    t.string   "lookup_type"
    t.string   "lookup_value"
    t.text     "other_details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "comments_count", default: 0, null: false
  end

  add_index "posts", ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at"

  create_table "soils", force: true do |t|
    t.integer  "farm_detail_id"
    t.string   "soil_type"
    t.string   "soil_texture"
    t.string   "water_availability"
    t.string   "soil_ph"
    t.string   "soil_biota"
    t.string   "season"
    t.integer  "year_of_details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.integer  "phone_no"
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
