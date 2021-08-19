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

ActiveRecord::Schema.define(version: 2021_08_19_135039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

end
