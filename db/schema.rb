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

ActiveRecord::Schema.define(:version => 20130426200448) do

  create_table "announcements", :force => true do |t|
    t.string    "title"
    t.text      "text"
    t.string    "link"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.date      "start_date"
    t.date      "end_date"
    t.boolean   "publicly_visible"
  end

  create_table "calendars", :force => true do |t|
    t.string    "name"
    t.string    "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string    "data_file_name"
    t.string    "data_content_type"
    t.integer   "data_file_size"
    t.integer   "assetable_id"
    t.string    "assetable_type",    :limit => 30
    t.string    "type"
    t.integer   "width"
    t.integer   "height"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "data_updated_at"
    t.string    "tags"
    t.string    "caption"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "index_ckeditor_assets_on_assetable_type_and_assetable_id"
  add_index "ckeditor_assets", ["type"], :name => "index_ckeditor_assets_on_type"

  create_table "custom_pages", :force => true do |t|
    t.string    "menu_title"
    t.string    "title"
    t.string    "description"
    t.text      "contents"
    t.boolean   "display_children_on_side_menu"
    t.boolean   "display_children_as_dropdown_menu"
    t.string    "slug"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "parent_page_id"
    t.boolean   "publicly_visible"
  end

  add_index "custom_pages", ["parent_page_id"], :name => "index_custom_pages_on_parent_page_id"

  create_table "documents", :force => true do |t|
    t.string    "name"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "data_file_name"
    t.string    "data_content_type"
    t.integer   "data_file_size"
    t.timestamp "data_updated_at"
  end

  create_table "events", :force => true do |t|
    t.string    "title"
    t.timestamp "starts_at"
    t.timestamp "ends_at"
    t.boolean   "all_day"
    t.text      "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "member_profiles", :force => true do |t|
    t.text      "bio"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "member_id"
  end

  add_index "member_profiles", ["member_id"], :name => "index_member_profiles_on_member_id"

  create_table "members", :force => true do |t|
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

  add_index "members", ["state"], :name => "index_members_on_state"

  create_table "members_positions", :id => false, :force => true do |t|
    t.integer "member_id"
    t.integer "position_id"
  end

  create_table "photos", :force => true do |t|
    t.string    "name"
    t.string    "caption"
    t.string    "tags"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "data_file_name"
    t.string    "data_content_type"
    t.integer   "data_file_size"
    t.timestamp "data_updated_at"
    t.boolean   "publicly_visible",  :default => true
    t.boolean   "slideshow",         :default => false
  end

  create_table "photos_user_profiles", :id => false, :force => true do |t|
    t.integer "photo_id"
    t.integer "user_profile_id"
  end

  create_table "positions", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer   "member_id"
  end

  add_index "positions", ["member_id"], :name => "index_positions_on_member_id"

  create_table "profilesubls", :force => true do |t|
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "user_profiles", :force => true do |t|
    t.text      "bio"
    t.date      "publish_date"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "inactive"
    t.datetime "key_timestamp"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

end
