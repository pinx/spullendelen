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

ActiveRecord::Schema.define(version: 20140508031031) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "circles", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_circles", force: true do |t|
    t.integer  "member_id"
    t.integer  "circle_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "member_circles", ["circle_id"], name: "index_member_circles_on_circle_id", using: :btree
  add_index "member_circles", ["member_id"], name: "index_member_circles_on_member_id", using: :btree

  create_table "members", force: true do |t|
    t.string   "nick_name"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "gender",                      limit: 1
    t.string   "website_url"
    t.text     "about"
    t.integer  "asset_id"
    t.integer  "requests_for_me_count",                 default: 0
    t.integer  "accepted_by_me_count",                  default: 0
    t.integer  "lent_out_by_me_count",                  default: 0
    t.integer  "requests_by_me_count",                  default: 0
    t.integer  "to_be_picked_up_by_me_count",           default: 0
    t.integer  "borrowed_by_me_count",                  default: 0
    t.integer  "to_be_reviewed_by_me_count"
    t.boolean  "newsletter",                            default: false
    t.boolean  "admin",                                 default: false
    t.string   "facebook_id"
    t.string   "twitter_id"
    t.string   "google_id"
    t.string   "picture_url"
    t.string   "email",                                 default: "",    null: false
    t.string   "encrypted_password",                    default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "street"
    t.string   "city"
    t.string   "postcode"
    t.string   "state"
    t.string   "country"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "things", force: true do |t|
    t.integer  "member_id"
    t.integer  "category_id"
    t.string   "source"
    t.string   "source_id"
    t.string   "source_url"
    t.integer  "asset_id"
    t.string   "name"
    t.string   "creator"
    t.integer  "price"
    t.text     "description"
    t.text     "story"
    t.date     "active_from"
    t.date     "active_to"
    t.boolean  "borrow_everyone"
    t.boolean  "borrow_circles"
    t.boolean  "borrow_friends"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "things", ["member_id"], name: "index_things_on_member_id", using: :btree

  create_table "transactions", force: true do |t|
    t.integer  "thing_id"
    t.integer  "borrower_id"
    t.integer  "owner_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wishes", force: true do |t|
    t.integer  "member_id"
    t.string   "description"
    t.string   "story"
    t.date     "active_from"
    t.date     "active_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wishes", ["member_id"], name: "index_wishes_on_member_id", using: :btree

end
