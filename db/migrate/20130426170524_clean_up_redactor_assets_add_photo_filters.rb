class CleanUpRedactorAssetsAddPhotoFilters < ActiveRecord::Migration
  def self.up
    drop_table :redactor_assets

    add_column :photos, :publicly_visible, :boolean
    add_column :photos, :slide, :boolean
  end

  def self.down
    remove_column :photos, :publicly_visible
    remove_column :photos, :slide

    create_table "redactor_assets", :force => true do |t|
      t.integer  "user_id"
      t.string   "data_file_name",                  :null => false
      t.string   "data_content_type"
      t.integer  "data_file_size"
      t.integer  "assetable_id"
      t.string   "assetable_type",    :limit => 30
      t.string   "type",              :limit => 30
      t.integer  "width"
      t.integer  "height"
      t.datetime "created_at",                      :null => false
      t.datetime "updated_at",                      :null => false
    end

    add_index "redactor_assets", ["assetable_type", "assetable_id"], :name => "idx_redactor_assetable"
    add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_redactor_assetable_type"
  end
end
