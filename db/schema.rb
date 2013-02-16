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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130216020440) do

  create_table "custom_pages", :force => true do |t|
    t.string   "menu_title"
    t.string   "title"
    t.string   "description"
    t.text     "contents"
    t.boolean  "display_children_on_side_menu"
    t.boolean  "display_children_as_dropdown_menu"
    t.boolean  "visible_to_public"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_page_id"
  end

  add_index "custom_pages", ["parent_page_id"], :name => "index_custom_pages_on_parent_page_id"

  create_table "profilesubls", :force => true do |t|
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "user_profiles", :force => true do |t|
    t.text      "bio"
    t.date      "publish_date"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "top_photo_file_name"
    t.string    "top_photo_content_type"
    t.integer   "top_photo_file_size"
    t.timestamp "top_photo_updated_at"
    t.string    "bottom_photo_file_name"
    t.string    "bottom_photo_content_type"
    t.integer   "bottom_photo_file_size"
    t.timestamp "bottom_photo_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "crypted_password",          :limit => 40
    t.string    "salt",                      :limit => 40
    t.string    "remember_token"
    t.timestamp "remember_token_expires_at"
    t.string    "name"
    t.string    "email_address"
    t.boolean   "administrator",                           :default => false
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "state",                                   :default => "invited"
    t.timestamp "key_timestamp"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

end
