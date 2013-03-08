class DropUserProfilesToRenameIt < ActiveRecord::Migration
  def self.up
    drop_table :photos_user_profiles
    drop_table :user_profiles
  end

  def self.down
    create_table "photos_user_profiles", :id => false, :force => true do |t|
      t.integer "photo_id"
      t.integer "user_profile_id"
    end

    create_table "user_profiles", :force => true do |t|
      t.text     "bio"
      t.date     "publish_date"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
