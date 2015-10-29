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

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dancers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.float    "amount_raised"
    t.string   "bio"
    t.integer  "year"
    t.string   "gender"
    t.string   "tshirt"
    t.string   "residence"
    t.string   "shift"
    t.boolean  "first_time"
    t.string   "hear_about"
    t.string   "food_allergies"
    t.boolean  "vegetarian"
    t.string   "contact_name"
    t.string   "contact_number"
    t.string   "conditional_details"
    t.string   "dancing_for"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
    t.integer  "team_id"
    t.boolean  "staff_member"
    t.boolean  "is_accountant"
  end

  add_index "dancers", ["confirmation_token"], name: "index_dancers_on_confirmation_token", unique: true, using: :btree
  add_index "dancers", ["email"], name: "index_dancers_on_email", unique: true, using: :btree
  add_index "dancers", ["reset_password_token"], name: "index_dancers_on_reset_password_token", unique: true, using: :btree
  add_index "dancers", ["team_id"], name: "index_dancers_on_team_id", using: :btree

  create_table "donations", force: :cascade do |t|
    t.integer  "dancer_id"
    t.float    "amount"
    t.string   "name"
    t.string   "messages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "donations", ["dancer_id"], name: "index_donations_on_dancer_id", using: :btree

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

  add_foreign_key "dancers", "teams"
  add_foreign_key "donations", "dancers"
end
