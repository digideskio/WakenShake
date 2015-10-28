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

ActiveRecord::Schema.define(version: 20151022222718) do

# Could not dump table "dancers" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "donations", force: :cascade do |t|
    t.integer  "dancer_id"
    t.float    "amount"
    t.string   "name"
    t.string   "messages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "donations", ["dancer_id"], name: "index_donations_on_dancer_id"

  create_table "dorms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.string   "name"
    t.string   "theme"
    t.datetime "year"
    t.string   "overview"
    t.string   "amount_raised"
    t.string   "num_of_dancers"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "amount_raised"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
