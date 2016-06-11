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

ActiveRecord::Schema.define(version: 20160611074314) do

  create_table "answers", force: :cascade do |t|
    t.text     "answer",      limit: 65535
    t.integer  "user_id",     limit: 4
    t.integer  "question_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "areas", force: :cascade do |t|
    t.string  "postal_code",    limit: 255,              null: false
    t.integer "prefectural_id", limit: 4
    t.string  "city",           limit: 255, default: ""
    t.string  "street",         limit: 255, default: ""
  end

  add_index "areas", ["prefectural_id"], name: "index_areas_on_prefectural_id", using: :btree

  create_table "entries", force: :cascade do |t|
    t.integer  "off_meeting_id", limit: 4
    t.integer  "user_id",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "off_meetings", force: :cascade do |t|
    t.date     "day"
    t.string   "address",             limit: 255
    t.string   "level",               limit: 255
    t.text     "detail",              limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "summary",             limit: 255
    t.integer  "num_of_persons",      limit: 4
    t.integer  "user_id",             limit: 4
    t.string   "address_postal_code", limit: 255
    t.float    "latitude",            limit: 24
    t.float    "longitude",           limit: 24
  end

  create_table "prefecturals", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "questions", force: :cascade do |t|
    t.text     "question",       limit: 65535
    t.integer  "user_id",        limit: 4
    t.integer  "off_meeting_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id", limit: 4
    t.integer  "followed_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "nickname",               limit: 255
    t.string   "area",                   limit: 255
    t.string   "sex",                    limit: 255
    t.integer  "age",                    limit: 4
    t.text     "detail",                 limit: 65535
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
