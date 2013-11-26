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

ActiveRecord::Schema.define(version: 20131125211537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "citizens", force: true do |t|
    t.integer  "district_id",                null: false
    t.string   "type"
    t.string   "name",                       null: false
    t.string   "gender",                     null: false
    t.integer  "age",                        null: false
    t.integer  "tesserae"
    t.boolean  "alive",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id"
    t.string   "skill"
    t.integer  "rating"
    t.string   "style"
  end

  add_index "citizens", ["district_id"], name: "index_citizens_on_district_id", using: :btree
  add_index "citizens", ["game_id"], name: "index_citizens_on_game_id", using: :btree

  create_table "districts", force: true do |t|
    t.string "name",     null: false
    t.string "industry", null: false
  end

  create_table "games", force: true do |t|
    t.string "president", null: false
    t.string "name",      null: false
  end

  create_table "rounds", force: true do |t|
    t.integer "game_id", null: false
    t.text    "zone1"
    t.text    "zone2"
    t.text    "zone3"
    t.text    "zone4"
    t.text    "zone5"
    t.text    "zone6"
  end

  add_index "rounds", ["game_id"], name: "index_rounds_on_game_id", using: :btree

end
