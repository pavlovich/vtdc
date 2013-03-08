class DropProfilesublsAddedMemberProfiles < ActiveRecord::Migration
  def self.up
    drop_table :profilesubls

    create_table :member_profiles do |t|
      t.text     :bio
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    create_table "profilesubls", :force => true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    drop_table :member_profiles
  end
end
