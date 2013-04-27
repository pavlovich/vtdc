class ChangeToRdtext < ActiveRecord::Migration
  def self.up
    drop_table :ckeditor_assets
    drop_table :photos
  end

  def self.down
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

    create_table "photos", :force => true do |t|
      t.integer  "assetable_id"
      t.string   "assetable_type",    :limit => 30
      t.string   "type",              :limit => 30
      t.integer  "width"
      t.integer  "height"
      t.string   "tags"
      t.string   "caption"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "data_file_name"
      t.integer  "data_file_size"
      t.string   "data_content_type"
      t.datetime "data_updated_at"
    end
  end
end
