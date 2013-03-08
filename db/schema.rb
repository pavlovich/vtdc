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

ActiveRecord::Schema.define(:version => 20130308221503) do

  create_table "calendars", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "data_updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "index_ckeditor_assets_on_assetable_type_and_assetable_id"
  add_index "ckeditor_assets", ["type"], :name => "index_ckeditor_assets_on_type"

  create_table "custom_pages", :force => true do |t|
    t.string   "menu_title"
    t.string   "title"
    t.string   "description"
    t.text     "contents"
    t.boolean  "display_children_on_side_menu"
    t.boolean  "display_children_as_dropdown_menu"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_page_id"
    t.boolean  "publicly_visible"
  end

  add_index "custom_pages", ["parent_page_id"], :name => "index_custom_pages_on_parent_page_id"

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "all_day"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "invited"
    t.datetime "key_timestamp"
  end

  add_index "members", ["state"], :name => "index_members_on_state"

  create_table "profilesubls", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
