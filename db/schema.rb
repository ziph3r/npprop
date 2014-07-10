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

ActiveRecord::Schema.define(version: 20140709034903) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_default", default: false
  end

  create_table "images", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
  end

  create_table "inboxes", force: true do |t|
    t.string   "sender"
    t.string   "title"
    t.text     "message"
    t.boolean  "is_deleted", default: false
    t.boolean  "is_read",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "phone"
  end

  create_table "news", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "short_desc"
    t.boolean  "is_publish"
    t.integer  "cover_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_images", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_status_masters", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.float    "sell_price"
    t.float    "land_price"
    t.float    "sqr_area"
    t.float    "width"
    t.float    "depth"
    t.float    "rent_price"
    t.boolean  "is_show"
    t.integer  "product_status_master_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "zone_id"
    t.text     "short_desc"
    t.string   "code"
    t.integer  "province_id"
  end

  create_table "provinces", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zones", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
