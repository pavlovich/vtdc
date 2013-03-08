class AddMemberProfileRelationship < ActiveRecord::Migration
  def self.up
    add_column :member_profiles, :member_id, :integer

    add_index :member_profiles, [:member_id]
  end

  def self.down
    remove_column :member_profiles, :member_id

    remove_index :member_profiles, :name => :index_member_profiles_on_member_id rescue ActiveRecord::StatementInvalid
  end
end
