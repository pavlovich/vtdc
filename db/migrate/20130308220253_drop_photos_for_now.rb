class DropPhotosForNow < ActiveRecord::Migration
  def self.up
    drop_table :photos
  end

  def self.down
    create_table "photos", :force => true do |t|
      t.string   "caption"
      t.boolean  "public"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "photo_file_name"
      t.string   "photo_content_type"
      t.integer  "photo_file_size"
      t.datetime "photo_updated_at"
    end
  end
end
