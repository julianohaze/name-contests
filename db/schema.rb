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

ActiveRecord::Schema.define(version: 2020_02_01_201836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contests", force: :cascade do |t|
    t.string "code", null: false
    t.string "title", null: false
    t.text "description"
    t.string "status", null: false
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_contests_on_code", unique: true
  end

  create_table "names", force: :cascade do |t|
    t.bigint "contest_id"
    t.string "label"
    t.text "normalized_label", null: false
    t.string "description"
    t.integer "created_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contest_id", "normalized_label"], name: "index_names_on_contest_id_and_normalized_label", unique: true
    t.index ["contest_id"], name: "index_names_on_contest_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_key"], name: "index_users_on_api_key", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "name_id"
    t.boolean "up"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name_id", "created_by"], name: "index_votes_on_name_id_and_created_by", unique: true
    t.index ["name_id"], name: "index_votes_on_name_id"
  end

  add_foreign_key "names", "contests"
  add_foreign_key "votes", "names"
end
