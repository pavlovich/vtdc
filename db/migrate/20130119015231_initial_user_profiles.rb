class InitialUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      t.text     :bio
      t.date     :publish_date
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :profilesubls do |t|
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :user_profiles
    drop_table :profilesubls
  end
end
