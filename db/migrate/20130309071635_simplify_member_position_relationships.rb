class SimplifyMemberPositionRelationships < ActiveRecord::Migration
  def self.up
    remove_column :filled_positions, :member_id
    remove_column :filled_positions, :position_id

    add_column :positions, :member_id, :integer

    remove_index :filled_positions, :name => :index_filled_positions_on_position_id rescue ActiveRecord::StatementInvalid
    remove_index :filled_positions, :name => :index_filled_positions_on_member_id rescue ActiveRecord::StatementInvalid

    add_index :positions, [:member_id]
  end

  def self.down
    add_column :filled_positions, :member_id, :integer
    add_column :filled_positions, :position_id, :integer

    remove_column :positions, :member_id

    add_index :filled_positions, [:position_id]
    add_index :filled_positions, [:member_id]

    remove_index :positions, :name => :index_positions_on_member_id rescue ActiveRecord::StatementInvalid
  end
end
