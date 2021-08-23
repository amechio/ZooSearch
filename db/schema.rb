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

ActiveRecord::Schema.define(version: 2021_08_23_094622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliations", force: :cascade do |t|
    t.bigint "zoo_id"
    t.bigint "animal_id"
    t.text "feature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_affiliations_on_animal_id"
    t.index ["zoo_id"], name: "index_affiliations_on_zoo_id"
  end

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.string "english_name"
    t.string "scientific_name"
    t.string "distribution"
    t.integer "endangered_species"
    t.text "content"
    t.string "photo"
    t.string "kingdom"
    t.string "phylum"
    t.string "animal_class"
    t.string "order"
    t.string "family"
    t.string "genus"
    t.string "species"
    t.string "subspecies"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "wikipedia"
  end

  create_table "favorite_animals", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "animal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_favorite_animals_on_animal_id"
    t.index ["user_id"], name: "index_favorite_animals_on_user_id"
  end

  create_table "favorite_zoos", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "zoo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favorite_zoos_on_user_id"
    t.index ["zoo_id"], name: "index_favorite_zoos_on_zoo_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "live_prefecture"
    t.integer "favorite_prefecture"
    t.text "content"
    t.string "icon"
    t.boolean "owner", default: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zoos", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "content"
    t.string "photo"
    t.time "summer_workday_open"
    t.time "summer_workday_close"
    t.time "winter_workday_open"
    t.time "winter_workday_close"
    t.time "summer_holiday_open"
    t.time "summer_holiday_close"
    t.time "winter_holiday_open"
    t.time "winter_holiday_close"
    t.integer "general_price"
    t.integer "high_school_price"
    t.integer "junior_high_school_price"
    t.integer "primary_price"
    t.integer "senior_price"
    t.string "price_comment"
    t.string "holiday"
    t.integer "area"
    t.integer "prefecture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "home_page"
    t.index ["user_id"], name: "index_zoos_on_user_id"
  end

  add_foreign_key "affiliations", "animals"
  add_foreign_key "affiliations", "zoos"
  add_foreign_key "favorite_animals", "animals"
  add_foreign_key "favorite_animals", "users"
  add_foreign_key "favorite_zoos", "users"
  add_foreign_key "favorite_zoos", "zoos"
  add_foreign_key "zoos", "users"
end
