class DroppedDirectPhotoRefOnProfileAddedPhotoClass < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string   :caption
      t.boolean  :public
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :photo_file_name
      t.string   :photo_content_type
      t.integer  :photo_file_size
      t.datetime :photo_updated_at
    end

    create_table :photos_user_profiles, :id => false do |t|
      t.integer :photo_id
      t.integer :user_profile_id
    end

    remove_column :user_profiles, :top_photo_file_name
    remove_column :user_profiles, :top_photo_content_type
    remove_column :user_profiles, :top_photo_file_size
    remove_column :user_profiles, :top_photo_updated_at
    remove_column :user_profiles, :bottom_photo_file_name
    remove_column :user_profiles, :bottom_photo_content_type
    remove_column :user_profiles, :bottom_photo_file_size
    remove_column :user_profiles, :bottom_photo_updated_at
  end

  def self.down
    add_column :user_profiles, :top_photo_file_name, :string
    add_column :user_profiles, :top_photo_content_type, :string
    add_column :user_profiles, :top_photo_file_size, :integer
    add_column :user_profiles, :top_photo_updated_at, :timestamp
    add_column :user_profiles, :bottom_photo_file_name, :string
    add_column :user_profiles, :bottom_photo_content_type, :string
    add_column :user_profiles, :bottom_photo_file_size, :integer
    add_column :user_profiles, :bottom_photo_updated_at, :timestamp

    drop_table :photos
    drop_table :photos_user_profiles
  end
end
