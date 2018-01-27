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

ActiveRecord::Schema.define(version: 20180127092839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "readings", force: :cascade do |t|
    t.bigint "weather_station_id"
    t.date "day"
    t.datetime "time"
    t.decimal "rainfall_amount"
    t.decimal "temperature"
    t.decimal "dew_point"
    t.decimal "wind_speed"
    t.string "wind_direction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["weather_station_id"], name: "index_readings_on_weather_station_id"
  end

  create_table "weather_stations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
