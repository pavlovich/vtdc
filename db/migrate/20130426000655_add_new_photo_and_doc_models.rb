class AddNewPhotoAndDocModels < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :data_file_name
      t.string   :data_content_type
      t.integer  :data_file_size
      t.datetime :data_updated_at
    end

    create_table :photos do |t|
      t.string   :name
      t.string   :caption
      t.string   :tags
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :data_file_name
      t.string   :data_content_type
      t.integer  :data_file_size
      t.datetime :data_updated_at
    end
  end

  def self.down
    drop_table :documents
    drop_table :photos
  end
end
