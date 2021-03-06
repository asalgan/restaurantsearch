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

ActiveRecord::Schema.define(version: 20140303222424) do

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "menu_id"
    t.integer  "quantity",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: true do |t|
    t.integer "restaurant_id"
    t.string  "item"
    t.integer "calories"
    t.integer "fat"
    t.integer "carbs"
    t.integer "price"
    t.string  "category"
    t.string  "restaurant"
    t.string  "category_name"
    t.integer "parent_id"
  end

  create_table "restaurants", force: true do |t|
    t.string "name"
    t.string "location"
    t.string "cuisine"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

end
