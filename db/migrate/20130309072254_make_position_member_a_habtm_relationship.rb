class MakePositionMemberAHabtmRelationship < ActiveRecord::Migration
  def self.up
    create_table :members_positions, :id => false do |t|
      t.integer :member_id
      t.integer :position_id
    end

    remove_column :positions, :member_id

    remove_index :positions, :name => :index_positions_on_member_id rescue ActiveRecord::StatementInvalid
  end

  def self.down
    add_column :positions, :member_id, :integer

    drop_table :members_positions

    add_index :positions, [:member_id]
  end
end
