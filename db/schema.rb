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

ActiveRecord::Schema.define(version: 20160824090505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "folders", force: :cascade do |t|
    t.string   "name"
    t.text     "info"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.integer  "folder_id"
    t.boolean  "root",       default: false
  end

  add_index "folders", ["folder_id"], name: "index_folders_on_folder_id", using: :btree
  add_index "folders", ["user_id"], name: "index_folders_on_user_id", using: :btree

  create_table "records", force: :cascade do |t|
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "folder_id"
    t.integer  "user_id"
  end

  add_index "records", ["folder_id"], name: "index_records_on_folder_id", using: :btree
  add_index "records", ["user_id"], name: "index_records_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "birth_date"
    t.string   "country"
    t.string   "mobile"
    t.string   "language"
  end

  add_foreign_key "folders", "folders"
  add_foreign_key "folders", "users"
  add_foreign_key "records", "folders"
  add_foreign_key "records", "users"
end
