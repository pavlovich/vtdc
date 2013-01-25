class InitialMigration < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string   :crypted_password, :limit => 40
      t.string   :salt, :limit => 40
      t.string   :remember_token
      t.datetime :remember_token_expires_at
      t.string   :name
      t.string   :email_address
      t.boolean  :administrator, :default => false
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :state, :default => "invited"
      t.datetime :key_timestamp
    end
    add_index :users, [:state]

    xxx = User.create(:name => "Peter Pavlovich", :email_address => "pavlovich@gmail.com", :administrator => true, :password => "savannah", :password_confirmation => "savannah")
    xxx.state = "active"
    xxx.save
  end

  def self.down
    drop_table :users
  end
end
