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

ActiveRecord::Schema.define(version: 20140914035928) do

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "web_app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["web_app_id"], name: "index_events_on_web_app_id"

  create_table "web_apps", force: true do |t|
    t.string   "name"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "web_apps", ["token"], name: "index_web_apps_on_token", unique: true

end
