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

ActiveRecord::Schema.define(version: 20160313104407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "promos", force: :cascade do |t|
    t.string   "code",                   null: false
    t.integer  "usages",     default: 0
    t.integer  "limit"
    t.integer  "sale",                   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "type_sale",  default: 0, null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.string   "description"
    t.string   "text"
    t.integer  "price",       null: false
    t.string   "ip",          null: false
    t.integer  "promo_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
