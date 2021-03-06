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

ActiveRecord::Schema.define(version: 20161218021002) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "strava_id"
    t.string   "name"
    t.datetime "start_date"
    t.string   "timezone"
    t.float    "start_lat",            limit: 24
    t.float    "start_long",           limit: 24
    t.float    "end_lat",              limit: 24
    t.float    "end_long",             limit: 24
    t.text     "raw",                  limit: 65535
    t.boolean  "businesses_processed"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["strava_id"], name: "index_activities_on_strava_id", using: :btree
    t.index ["user_id"], name: "index_activities_on_user_id", using: :btree
  end

  create_table "businesses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "yelp_id"
    t.string   "name"
    t.string   "url"
    t.string   "display_phone"
    t.float    "rating",          limit: 24
    t.text     "display_address", limit: 65535
    t.float    "latitude",        limit: 24
    t.float    "longitude",       limit: 24
    t.text     "raw",             limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["yelp_id"], name: "index_businesses_on_yelp_id", unique: true, using: :btree
  end

  create_table "distances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "business_id"
    t.integer  "activity_id"
    t.integer  "meters"
    t.integer  "point_type"
    t.boolean  "close_to_point"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["activity_id"], name: "index_distances_on_activity_id", using: :btree
    t.index ["business_id"], name: "index_distances_on_business_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "strava_access_token"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_foreign_key "activities", "users"
  add_foreign_key "distances", "activities"
  add_foreign_key "distances", "businesses"
end
