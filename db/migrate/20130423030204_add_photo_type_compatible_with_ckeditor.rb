class AddPhotoTypeCompatibleWithCkeditor < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer  :assetable_id
      t.string   :assetable_type, :limit => 30
      t.string   :type, :limit => 30
      t.integer  :width
      t.integer  :height
      t.string   :tags
      t.string   :caption
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :data_file_name
      t.integer  :data_file_size
      t.string   :data_content_type
      t.datetime :data_updated_at
    end

    add_column :ckeditor_assets, :tags, :string
    add_column :ckeditor_assets, :caption, :string
  end

  def self.down
    remove_column :ckeditor_assets, :tags
    remove_column :ckeditor_assets, :caption

    drop_table :photos
  end
end
